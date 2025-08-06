# Hetzner nodes (50 nodes with 8 validators each = 400 validators)
# Starting validator index: 0 (moved to beginning for clean separation)

# Bootnode
variable "bootnode" {
  default = {
    name            = "bootnode"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "mev_relay" {
  default = {
    name            = "mev-relay"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

# Lighthouse (42% of 50 = 21 nodes)
variable "lighthouse_geth" {
  default = {
    name            = "lighthouse-geth"
    count           = 8
    validator_start = 0
    validator_end   = 64
  }
}

variable "lighthouse_nethermind" {
  default = {
    name            = "lighthouse-nethermind"
    count           = 8
    validator_start = 64
    validator_end   = 128
  }
}

variable "lighthouse_besu" {
  default = {
    name            = "lighthouse-besu"
    count           = 4
    validator_start = 128
    validator_end   = 160
  }
}

variable "lighthouse_erigon" {
  default = {
    name            = "lighthouse-erigon"
    count           = 1
    validator_start = 160
    validator_end   = 168
  }
}

variable "lighthouse_reth" {
  default = {
    name            = "lighthouse-reth"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "lighthouse_nimbusel" {
  default = {
    name            = "lighthouse-nimbusel"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

# Prysm (31% of 50 = 16 nodes)
variable "prysm_geth" {
  default = {
    name            = "prysm-geth"
    count           = 6
    validator_start = 168
    validator_end   = 216
  }
}

variable "prysm_nethermind" {
  default = {
    name            = "prysm-nethermind"
    count           = 6
    validator_start = 216
    validator_end   = 264
  }
}

variable "prysm_besu" {
  default = {
    name            = "prysm-besu"
    count           = 3
    validator_start = 264
    validator_end   = 288
  }
}

variable "prysm_erigon" {
  default = {
    name            = "prysm-erigon"
    count           = 1
    validator_start = 288
    validator_end   = 296
  }
}

variable "prysm_reth" {
  default = {
    name            = "prysm-reth"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "prysm_nimbusel" {
  default = {
    name            = "prysm-nimbusel"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

# Teku (14% of 50 = 7 nodes)
variable "teku_geth" {
  default = {
    name            = "teku-geth"
    count           = 3
    validator_start = 296
    validator_end   = 320
  }
}

variable "teku_nethermind" {
  default = {
    name            = "teku-nethermind"
    count           = 3
    validator_start = 320
    validator_end   = 344
  }
}

variable "teku_besu" {
  default = {
    name            = "teku-besu"
    count           = 1
    validator_start = 344
    validator_end   = 352
  }
}

variable "teku_erigon" {
  default = {
    name            = "teku-erigon"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "teku_reth" {
  default = {
    name            = "teku-reth"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "teku_nimbusel" {
  default = {
    name            = "teku-nimbusel"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

# Nimbus (9% of 50 = 5 nodes)
variable "nimbus_geth" {
  default = {
    name            = "nimbus-geth"
    count           = 2
    validator_start = 352
    validator_end   = 368
  }
}

variable "nimbus_nethermind" {
  default = {
    name            = "nimbus-nethermind"
    count           = 2
    validator_start = 368
    validator_end   = 384
  }
}

variable "nimbus_besu" {
  default = {
    name            = "nimbus-besu"
    count           = 1
    validator_start = 384
    validator_end   = 392
  }
}

variable "nimbus_erigon" {
  default = {
    name            = "nimbus-erigon"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "nimbus_reth" {
  default = {
    name            = "nimbus-reth"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "nimbus_nimbusel" {
  default = {
    name            = "nimbus-nimbusel"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

# Lodestar (3% of 50 = 1 node)
variable "lodestar_geth" {
  default = {
    name            = "lodestar-geth"
    count           = 1
    validator_start = 392
    validator_end   = 400
  }
}

variable "lodestar_nethermind" {
  default = {
    name            = "lodestar-nethermind"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "lodestar_besu" {
  default = {
    name            = "lodestar-besu"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "lodestar_erigon" {
  default = {
    name            = "lodestar-erigon"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "lodestar_reth" {
  default = {
    name            = "lodestar-reth"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "lodestar_nimbusel" {
  default = {
    name            = "lodestar-nimbusel"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

# Grandine - No nodes in Hetzner
variable "grandine_geth" {
  default = {
    name            = "grandine-geth"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "grandine_nethermind" {
  default = {
    name            = "grandine-nethermind"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "grandine_besu" {
  default = {
    name            = "grandine-besu"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "grandine_erigon" {
  default = {
    name            = "grandine-erigon"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "grandine_reth" {
  default = {
    name            = "grandine-reth"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "grandine_nimbusel" {
  default = {
    name            = "grandine-nimbusel"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}