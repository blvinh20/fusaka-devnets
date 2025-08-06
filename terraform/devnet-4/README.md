# Devnet-4 Configuration

## Overview
Devnet-4 consists of 1500 nodes distributed across DigitalOcean and Hetzner cloud providers with a specific client distribution to test network diversity.

## Node Distribution

### Total Nodes: 1500
- **DigitalOcean: 1450 nodes**
  - 10 bootnodes (non-validating supernodes)
  - 100 supernodes (320 validators each = 32,000 validators)
  - 1340 fullnodes (8 validators each = 10,720 validators)
  
- **Hetzner: 50 nodes**
  - 50 fullnodes (8 validators each = 400 validators)

**Total validators: 43,120**

## Client Distribution

### Consensus Layer (CL) Distribution
| Client | Percentage | Node Count |
|--------|------------|------------|
| Lighthouse | 42% | 626 |
| Prysm | 31% | 462 |
| Teku | 14% | 209 |
| Nimbus | 9% | 134 |
| Lodestar | 3% | 45 |
| Grandine | 1% | 14 |
| **Total** | **100%** | **1490** |

### Execution Layer (EL) Distribution
| Client | Percentage | Node Count |
|--------|------------|------------|
| Geth | 39% | 581 |
| Nethermind | 39% | 581 |
| Besu | 16% | 238 |
| Erigon | 3% | 45 |
| Reth | 2% | 30 |
| Nimbusel | 1% | 15 |
| **Total** | **100%** | **1490** |

## CL-EL Combination Matrix

| CL/EL | Geth | Nethermind | Besu | Erigon | Reth | Nimbusel | Total |
|-------|------|------------|------|--------|------|----------|-------|
| **Lighthouse** (626) | 245 | 245 | 100 | 19 | 12 | 5 | 626 |
| **Prysm** (462) | 180 | 180 | 74 | 14 | 9 | 5 | 462 |
| **Teku** (209) | 82 | 82 | 33 | 6 | 4 | 2 | 209 |
| **Nimbus** (134) | 52 | 52 | 22 | 4 | 3 | 1 | 134 |
| **Lodestar** (45) | 18 | 18 | 7 | 1 | 1 | 0 | 45 |
| **Grandine** (14) | 4 | 4 | 2 | 1 | 1 | 2 | 14 |
| **Total** | 581 | 581 | 238 | 45 | 30 | 15 | 1490 |

*Note: Bootnodes (10 nodes) are excluded from the percentage calculations as they are non-validating nodes.*

## Key Features

1. **Variable Validator Counts:** 
   - Supernodes: 320 validators each
   - Fullnodes: 8 validators each
   - Bootnodes: 0 validators (non-validating)

2. **Even Region Distribution:** 
   - Nodes are automatically distributed evenly across all available DigitalOcean regions
   - Regions include: nyc1, sgp1, lon1, nyc3, ams3, fra1, tor1, blr1, sfo3, syd1

3. **Supernode Detection:** 
   - Nodes are automatically marked as supernodes based on:
     - Validator count (≥320 validators)
     - Name suffix containing "super"

4. **Infrastructure Sizing:**
   - Supernodes: `s-8vcpu-32gb-640gb-intel` (high performance with NVMe storage)
   - Fullnodes: `s-8vcpu-16gb` (standard performance)
   - MEV Relay: `m3-8vcpu-64gb` (memory optimized)

## Terraform Structure

```
terraform/devnet-4/
├── README.md              # This file
├── main.tf               # Main terraform configuration
├── nodes.tf              # DigitalOcean node definitions
├── digitalocean.tf       # DigitalOcean provider and resources
├── ansible_inventory.tmpl # Ansible inventory template
└── hetzner/
    ├── main.tf          # Hetzner main configuration
    ├── nodes.tf         # Hetzner node definitions
    ├── hetzner.tf       # Hetzner provider configuration
    └── firewall.tf      # Hetzner firewall rules
```

## Deployment

To deploy this devnet:

1. Initialize terraform:
   ```bash
   cd terraform/devnet-4
   terraform init
   ```

2. Review the planned changes:
   ```bash
   terraform plan
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```

## Notes

- The validator distribution ensures each node type has the appropriate number of validators
- Supernodes handle the bulk of validation (32,000 validators) with high-performance hardware
- Fullnodes provide network diversity with smaller validator sets (8 validators each)
- The configuration supports dynamic validator count allocation per node group