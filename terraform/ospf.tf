# Query point-to-point link prefixes tagged for OSPF area 0

data "netbox_prefixes" "ospf_area0" {
  filter {
    name  = "tag"
    value = "ospf-area0"
  }
}

# Build the OSPF network statement list dynamically from the tagged prefixes
# Netbox returns e.g. 10.0.12.0/30 - iosxe networks need the base IP, a wildcard
# mask and an area, so pull the address portion out of the CIDR here.

locals {
  ospf_networks = [
    for p in data.netbox_prefixes.ospf_area0.prefixes : {
      ip       = split("/", p.prefix)[0]
      wildcard = "0.0.0.3"
      area     = "0"
    }
  ]

  # Explicit reference bandwidth (Mbps) so cost calculations stay meaningful on
  # multi-gig links and so drift from manual "auto-cost reference-bandwidth"
  # changes on-box is caught and reverted by Terraform.
  ospf_reference_bandwidth = 100000
}

resource "iosxe_ospf" "R1" {
  provider                      = iosxe.R1
  process_id                    = 1
  router_id                     = local.R1_lo_ip
  networks                      = local.ospf_networks
  auto_cost_reference_bandwidth = local.ospf_reference_bandwidth
}

resource "iosxe_ospf" "R2" {
  provider                      = iosxe.R2
  process_id                    = 1
  router_id                     = local.R2_lo_ip
  networks                      = local.ospf_networks
  auto_cost_reference_bandwidth = local.ospf_reference_bandwidth
}

resource "iosxe_ospf" "R3" {
  provider                      = iosxe.R3
  process_id                    = 1
  router_id                     = local.R3_lo_ip
  networks                      = local.ospf_networks
  auto_cost_reference_bandwidth = local.ospf_reference_bandwidth
}
