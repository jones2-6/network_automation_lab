# Query area-0 /30 link prefixes from Netbox (tagged ospf-area0)

data "netbox_prefixes" "ospf_area0" {
  filter {
    name  = "tag"
    value = "ospf-area0"
  }
}

locals {
  # cidrhost(..., 0) normalizes each Netbox prefix to its network address
  ospf_networks = [
    for p in data.netbox_prefixes.ospf_area0.prefixes : {
      ip       = cidrhost(p.prefix, 0)
      wildcard = "0.0.0.3"
      area     = "0"
    }
  ]
}

resource "iosxe_ospf" "R1" {
  provider   = iosxe.R1
  process_id = 1
  router_id  = local.R1_lo_ip
  networks   = local.ospf_networks

  auto_cost_reference_bandwidth = var.ospf_reference_bandwidth
}

resource "iosxe_ospf" "R2" {
  provider   = iosxe.R2
  process_id = 1
  router_id  = local.R2_lo_ip
  networks   = local.ospf_networks

  auto_cost_reference_bandwidth = var.ospf_reference_bandwidth
}

resource "iosxe_ospf" "R3" {
  provider   = iosxe.R3
  process_id = 1
  router_id  = local.R3_lo_ip
  networks   = local.ospf_networks

  auto_cost_reference_bandwidth = var.ospf_reference_bandwidth
}
