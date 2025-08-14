#!/usr/bin/env python3

def remove_arm_endpoints(file_path):
    """Remove all endpoints that have 'arm' in their names from the values.yaml file."""
    
    with open(file_path, 'r') as f:
        lines = f.readlines()
    
    new_lines = []
    i = 0
    
    while i < len(lines):
        line = lines[i]
        
        # Check if this line starts an endpoint block
        if line.strip().startswith('- url:'):
            # Check if the URL contains 'arm'
            if 'arm' in line:
                # This is an ARM endpoint, skip until we find the next endpoint or section
                i += 1
                while i < len(lines):
                    next_line = lines[i]
                    # If we hit another endpoint or a new section, stop skipping
                    if (next_line.strip().startswith('- url:') or 
                        (next_line.strip() and not next_line.strip().startswith('  ') and not next_line.strip().startswith('#'))):
                        break
                    i += 1
                continue
            else:
                # Not an ARM endpoint, keep it
                new_lines.append(line)
                i += 1
        else:
            # Regular line, keep it
            new_lines.append(line)
            i += 1
    
    # Write the cleaned content back
    with open(file_path, 'w') as f:
        f.writelines(new_lines)
    
    print(f"Removed ARM endpoints from {file_path}")

if __name__ == "__main__":
    remove_arm_endpoints("values.yaml")
