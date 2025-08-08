#!/usr/bin/env python3

import re
import sys
import os
from pathlib import Path
from typing import Dict, List, Tuple

def find_available_devnets() -> List[str]:
    """Find all available devnet inventory files."""
    # Handle running from scripts directory or root
    if os.path.exists("ansible/inventories"):
        inventory_base = Path("ansible/inventories")
    elif os.path.exists("../ansible/inventories"):
        inventory_base = Path("../ansible/inventories")
    else:
        print("Could not find ansible/inventories directory")
        return []
    
    devnets = []
    
    if inventory_base.exists():
        for devnet_dir in sorted(inventory_base.iterdir()):
            if devnet_dir.is_dir() and devnet_dir.name.startswith("devnet-"):
                # Check if any .ini files exist in the directory
                ini_files = list(devnet_dir.glob("*.ini"))
                if ini_files:
                    devnets.append(devnet_dir.name)
    
    return devnets

def parse_inventory_file(inventory_path: str) -> List[Tuple[int, int, str]]:
    """Parse the inventory.ini file and extract validator ranges."""
    ranges = []
    
    with open(inventory_path, 'r') as f:
        for line in f:
            line = line.strip()
            
            # Skip empty lines, comments, and group headers
            if not line or line.startswith('[') or line.startswith('#'):
                continue
            
            # Look for lines with validator_start and validator_end
            if 'validator_start=' in line and 'validator_end=' in line:
                # Extract the node name (first part before space)
                parts = line.split()
                if parts:
                    node_name = parts[0]
                    
                    # Extract validator_start and validator_end values
                    start_match = re.search(r'validator_start=(\d+)', line)
                    end_match = re.search(r'validator_end=(\d+)', line)
                    
                    if start_match and end_match:
                        start = int(start_match.group(1))
                        end = int(end_match.group(1))
                        ranges.append((start, end, node_name))
    
    # Sort ranges by start value
    ranges.sort(key=lambda x: x[0])
    return ranges

def format_ranges(ranges: List[Tuple[int, int, str]]) -> str:
    """Format ranges in the required YAML format."""
    output_lines = ["ranges: |"]
    
    for start, end, node_name in ranges:
        # Format the range line
        output_lines.append(f"  {start}-{end}: {node_name}")
    
    return '\n'.join(output_lines)

def main():
    # Find available devnets
    devnets = find_available_devnets()
    
    if not devnets:
        print("No devnet inventory files found in ansible/inventories/")
        return
    
    # Display available devnets
    print("Available devnets:")
    for i, devnet in enumerate(devnets, 1):
        print(f"  {i}. {devnet}")
    
    # Ask user to select devnet(s)
    print("\nEnter devnet selection(s):")
    print("  - Single number (e.g., '3' for devnet-3)")
    print("  - Multiple numbers separated by commas (e.g., '1,3,4')")
    print("  - Range (e.g., '1-3')")
    print("  - 'all' for all devnets")
    
    selection = input("\nYour selection: ").strip().lower()
    
    selected_devnets = []
    
    if selection == 'all':
        selected_devnets = devnets
    elif '-' in selection and not selection.startswith('-'):
        # Handle range like "1-3"
        try:
            start, end = map(int, selection.split('-'))
            for i in range(start, end + 1):
                if 1 <= i <= len(devnets):
                    selected_devnets.append(devnets[i - 1])
        except:
            print(f"Invalid range: {selection}")
            return
    elif ',' in selection:
        # Handle comma-separated list like "1,3,4"
        try:
            indices = [int(x.strip()) for x in selection.split(',')]
            for i in indices:
                if 1 <= i <= len(devnets):
                    selected_devnets.append(devnets[i - 1])
        except:
            print(f"Invalid selection: {selection}")
            return
    else:
        # Handle single number
        try:
            index = int(selection)
            if 1 <= index <= len(devnets):
                selected_devnets.append(devnets[index - 1])
            else:
                print(f"Invalid selection: {index}")
                return
        except:
            print(f"Invalid selection: {selection}")
            return
    
    if not selected_devnets:
        print("No valid devnets selected")
        return
    
    # Determine inventory base path
    if os.path.exists("ansible/inventories"):
        inventory_base = Path("ansible/inventories")
    else:
        inventory_base = Path("../ansible/inventories")
    
    # Process each selected devnet
    for devnet in selected_devnets:
        devnet_path = inventory_base / devnet
        
        print(f"\n{'='*60}")
        print(f"Processing {devnet}")
        print(f"{'='*60}")
        
        # Find all .ini files in the devnet directory
        ini_files = sorted(devnet_path.glob("*.ini"))
        
        if not ini_files:
            print(f"No inventory files found in {devnet}")
            continue
        
        # Collect ranges from all inventory files
        all_ranges = []
        for ini_file in ini_files:
            print(f"Reading {ini_file.name}...")
            ranges = parse_inventory_file(str(ini_file))
            if ranges:
                all_ranges.extend(ranges)
                print(f"  Found {len(ranges)} validator ranges")
        
        if not all_ranges:
            print(f"No validator ranges found in {devnet}")
            continue
        
        # Sort all ranges by start value
        all_ranges.sort(key=lambda x: x[0])
        
        # Format the ranges
        formatted_output = format_ranges(all_ranges)
        
        # Write to devnet-specific ranges file with format: devnet-<num>-ranges.yaml
        output_path = f"{devnet}-ranges.yaml"
        with open(output_path, 'w') as f:
            f.write(formatted_output)
        
        print(f"\nSuccessfully wrote {len(all_ranges)} total validator ranges to {output_path}")
        
        # Show first few lines as preview
        lines = formatted_output.split('\n')
        preview_lines = 10
        if len(lines) > preview_lines:
            print(f"\nPreview (first {preview_lines} ranges):")
            for line in lines[:preview_lines + 1]:  # +1 for the "ranges: |" line
                print(line)
            print(f"  ... ({len(all_ranges) - preview_lines + 1} more ranges)")
        else:
            print("\nGenerated ranges:")
            print(formatted_output)

if __name__ == "__main__":
    main()