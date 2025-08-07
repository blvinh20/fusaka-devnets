# # Bootnodes (10 non-validating supernodes in DigitalOcean)
# variable "bootnode" {
#   default = {
#     name            = "bootnode"
#     count           = 10
#     validator_start = 0
#     validator_end   = 0
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# variable "mev_relay" {
#   default = {
#     name            = "mev-relay"
#     count           = 1
#     validator_start = 0
#     validator_end   = 0
#     size            = "m3-8vcpu-64gb"
#   }
# }

# SUPERNODES (100 nodes with 320 validators each = 32,000 validators)
# Distributed proportionally across CL-EL combinations

# Lighthouse Supernodes (42% of 100 = 42 supernodes)
variable "lighthouse_geth_full" {
  default = {
    name            = "lighthouse-geth-full"
    count           = 1
    validator_start = 400
    validator_end   = 5520
  }
}

variable "lighthouse_nethermind_super" {
  default = {
    name            = "lighthouse-nethermind-super"
    count           = 1
    validator_start = 5520
    validator_end   = 10640
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

# variable "lighthouse_besu_super" {
#   default = {
#     name            = "lighthouse-besu-super"
#     count           = 7
#     validator_start = 10640
#     validator_end   = 12880
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# variable "lighthouse_erigon_super" {
#   default = {
#     name            = "lighthouse-erigon-super"
#     count           = 2
#     validator_start = 12880
#     validator_end   = 13520
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# variable "lighthouse_reth_super" {
#   default = {
#     name            = "lighthouse-reth-super"
#     count           = 1
#     validator_start = 13520
#     validator_end   = 13840
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# # Prysm Supernodes (31% of 100 = 31 supernodes)
# variable "prysm_geth_super" {
#   default = {
#     name            = "prysm-geth-super"
#     count           = 12
#     validator_start = 13840
#     validator_end   = 17680
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# variable "prysm_nethermind_super" {
#   default = {
#     name            = "prysm-nethermind-super"
#     count           = 12
#     validator_start = 17680
#     validator_end   = 21520
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# variable "prysm_besu_super" {
#   default = {
#     name            = "prysm-besu-super"
#     count           = 5
#     validator_start = 21520
#     validator_end   = 23120
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# variable "prysm_erigon_super" {
#   default = {
#     name            = "prysm-erigon-super"
#     count           = 1
#     validator_start = 23120
#     validator_end   = 23440
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# variable "prysm_reth_super" {
#   default = {
#     name            = "prysm-reth-super"
#     count           = 1
#     validator_start = 23440
#     validator_end   = 23760
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# # Teku Supernodes (14% of 100 = 14 supernodes)
# variable "teku_geth_super" {
#   default = {
#     name            = "teku-geth-super"
#     count           = 5
#     validator_start = 23760
#     validator_end   = 25360
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# variable "teku_nethermind_super" {
#   default = {
#     name            = "teku-nethermind-super"
#     count           = 5
#     validator_start = 25360
#     validator_end   = 26960
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# variable "teku_besu_super" {
#   default = {
#     name            = "teku-besu-super"
#     count           = 3
#     validator_start = 26960
#     validator_end   = 27920
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# variable "teku_erigon_super" {
#   default = {
#     name            = "teku-erigon-super"
#     count           = 1
#     validator_start = 27920
#     validator_end   = 28240
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# # Nimbus Supernodes (9% of 100 = 9 supernodes)
# variable "nimbus_geth_super" {
#   default = {
#     name            = "nimbus-geth-super"
#     count           = 4
#     validator_start = 28240
#     validator_end   = 29520
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# variable "nimbus_nethermind_super" {
#   default = {
#     name            = "nimbus-nethermind-super"
#     count           = 3
#     validator_start = 29520
#     validator_end   = 30480
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# variable "nimbus_besu_super" {
#   default = {
#     name            = "nimbus-besu-super"
#     count           = 2
#     validator_start = 30480
#     validator_end   = 31120
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# # Lodestar Supernodes (3% of 100 = 3 supernodes)
# variable "lodestar_geth_super" {
#   default = {
#     name            = "lodestar-geth-super"
#     count           = 1
#     validator_start = 31120
#     validator_end   = 31440
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# variable "lodestar_nethermind_super" {
#   default = {
#     name            = "lodestar-nethermind-super"
#     count           = 2
#     validator_start = 31440
#     validator_end   = 32080
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# # Grandine Supernodes (1% of 100 = 1 supernode)
# variable "grandine_nimbusel_super" {
#   default = {
#     name            = "grandine-nimbusel-super"
#     count           = 1
#     validator_start = 32080
#     validator_end   = 32400
#     size            = "s-8vcpu-32gb-640gb-intel"
#   }
# }

# # FULLNODES (1340 nodes with 8 validators each = 10,720 validators)
# # Starting validator index: 32400

# # Lighthouse Fullnodes (42% of 1340 = 563 fullnodes, adjusted to 584)
# variable "lighthouse_nethermind_full" {
#   default = {
#     name            = "lighthouse-nethermind-full"
#     count           = 229
#     validator_start = 32400
#     validator_end   = 34232
#   }
# }

# variable "lighthouse_besu_full" {
#   default = {
#     name            = "lighthouse-besu-full"
#     count           = 93
#     validator_start = 34232
#     validator_end   = 34976
#   }
# }

# variable "lighthouse_erigon_full" {
#   default = {
#     name            = "lighthouse-erigon-full"
#     count           = 17
#     validator_start = 34976
#     validator_end   = 35112
#   }
# }

# variable "lighthouse_reth_full" {
#   default = {
#     name            = "lighthouse-reth-full"
#     count           = 11
#     validator_start = 35112
#     validator_end   = 35200
#   }
# }

# variable "lighthouse_nimbusel_full" {
#   default = {
#     name            = "lighthouse-nimbusel-full"
#     count           = 5
#     validator_start = 35200
#     validator_end   = 35240
#   }
# }

# # Prysm Fullnodes (31% of 1340 = 415 fullnodes, adjusted to 431)
# variable "prysm_nethermind_full" {
#   default = {
#     name            = "prysm-nethermind-full"
#     count           = 168
#     validator_start = 35240
#     validator_end   = 36584
#   }
# }

# variable "prysm_besu_full" {
#   default = {
#     name            = "prysm-besu-full"
#     count           = 69
#     validator_start = 36584
#     validator_end   = 37136
#   }
# }

# variable "prysm_erigon_full" {
#   default = {
#     name            = "prysm-erigon-full"
#     count           = 13
#     validator_start = 37136
#     validator_end   = 37240
#   }
# }

# variable "prysm_reth_full" {
#   default = {
#     name            = "prysm-reth-full"
#     count           = 8
#     validator_start = 37240
#     validator_end   = 37304
#   }
# }

# variable "prysm_nimbusel_full" {
#   default = {
#     name            = "prysm-nimbusel-full"
#     count           = 5
#     validator_start = 37304
#     validator_end   = 37344
#   }
# }

# # Teku Fullnodes (14% of 1340 = 188 fullnodes, adjusted to 195)
# variable "teku_geth_full" {
#   default = {
#     name            = "teku-geth-full"
#     count           = 77
#     validator_start = 37344
#     validator_end   = 37960
#   }
# }

# variable "teku_nethermind_full" {
#   default = {
#     name            = "teku-nethermind-full"
#     count           = 77
#     validator_start = 37960
#     validator_end   = 38576
#   }
# }

# variable "teku_besu_full" {
#   default = {
#     name            = "teku-besu-full"
#     count           = 30
#     validator_start = 38576
#     validator_end   = 38816
#   }
# }

# variable "teku_erigon_full" {
#   default = {
#     name            = "teku-erigon-full"
#     count           = 5
#     validator_start = 38816
#     validator_end   = 38856
#   }
# }

# variable "teku_reth_full" {
#   default = {
#     name            = "teku-reth-full"
#     count           = 4
#     validator_start = 38856
#     validator_end   = 38888
#   }
# }

# variable "teku_nimbusel_full" {
#   default = {
#     name            = "teku-nimbusel-full"
#     count           = 2
#     validator_start = 38888
#     validator_end   = 38904
#   }
# }

# # Nimbus Fullnodes (9% of 1340 = 121 fullnodes, adjusted to 125)
# variable "nimbus_geth_full" {
#   default = {
#     name            = "nimbus-geth-full"
#     count           = 48
#     validator_start = 38904
#     validator_end   = 39288
#   }
# }

# variable "nimbus_nethermind_full" {
#   default = {
#     name            = "nimbus-nethermind-full"
#     count           = 49
#     validator_start = 39288
#     validator_end   = 39680
#   }
# }

# variable "nimbus_besu_full" {
#   default = {
#     name            = "nimbus-besu-full"
#     count           = 20
#     validator_start = 39680
#     validator_end   = 39840
#   }
# }

# variable "nimbus_erigon_full" {
#   default = {
#     name            = "nimbus-erigon-full"
#     count           = 4
#     validator_start = 39840
#     validator_end   = 39872
#   }
# }

# variable "nimbus_reth_full" {
#   default = {
#     name            = "nimbus-reth-full"
#     count           = 3
#     validator_start = 39872
#     validator_end   = 39896
#   }
# }

# variable "nimbus_nimbusel_full" {
#   default = {
#     name            = "nimbus-nimbusel-full"
#     count           = 1
#     validator_start = 39896
#     validator_end   = 39904
#   }
# }

# # Lodestar Fullnodes (3% of 1340 = 40 fullnodes, adjusted to 42)
# variable "lodestar_geth_full" {
#   default = {
#     name            = "lodestar-geth-full"
#     count           = 17
#     validator_start = 39904
#     validator_end   = 40040
#   }
# }

# variable "lodestar_nethermind_full" {
#   default = {
#     name            = "lodestar-nethermind-full"
#     count           = 16
#     validator_start = 40040
#     validator_end   = 40168
#   }
# }

# variable "lodestar_besu_full" {
#   default = {
#     name            = "lodestar-besu-full"
#     count           = 7
#     validator_start = 40168
#     validator_end   = 40224
#   }
# }

# variable "lodestar_erigon_full" {
#   default = {
#     name            = "lodestar-erigon-full"
#     count           = 1
#     validator_start = 40224
#     validator_end   = 40232
#   }
# }

# variable "lodestar_reth_full" {
#   default = {
#     name            = "lodestar-reth-full"
#     count           = 1
#     validator_start = 40232
#     validator_end   = 40240
#   }
# }

# # Grandine Fullnodes (1% of 1340 = 13 fullnodes)
# variable "grandine_geth_full" {
#   default = {
#     name            = "grandine-geth-full"
#     count           = 4
#     validator_start = 40240
#     validator_end   = 40272
#   }
# }

# variable "grandine_nethermind_full" {
#   default = {
#     name            = "grandine-nethermind-full"
#     count           = 4
#     validator_start = 40272
#     validator_end   = 40304
#   }
# }

# variable "grandine_besu_full" {
#   default = {
#     name            = "grandine-besu-full"
#     count           = 2
#     validator_start = 40304
#     validator_end   = 40320
#   }
# }

# variable "grandine_erigon_full" {
#   default = {
#     name            = "grandine-erigon-full"
#     count           = 1
#     validator_start = 40320
#     validator_end   = 40328
#   }
# }

# variable "grandine_reth_full" {
#   default = {
#     name            = "grandine-reth-full"
#     count           = 1
#     validator_start = 40328
#     validator_end   = 40336
#   }
# }

# variable "grandine_nimbusel_full" {
#   default = {
#     name            = "grandine-nimbusel-full"
#     count           = 1
#     validator_start = 40336
#     validator_end   = 40344
#   }
# }

# MOVED TO END FOR EASY HANDOVER - lighthouse_geth_full and prysm_geth_full
# variable "lighthouse_geth_full" {
#   default = {
#     name            = "lighthouse-geth-full"
#     count           = 229
#     validator_start = 40344
#     validator_end   = 42176
#   }
# }

# variable "prysm_geth_full" {
#   default = {
#     name            = "prysm-geth-full"
#     count           = 168
#     validator_start = 42176
#     validator_end   = 43520
#   }
# }