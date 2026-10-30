<<<<<<< HEAD
#Query area 0 point-to-point links from Netbox (tagged ospf-area0)
=======
# Query point-to-point link prefixes tagged for OSPF area 0
>>>>>>> 51920d909a9887a6a4f4b167d1b2358c63bb2198

data "netbox_prefixes" "ospf_area0" {
  filter {
    name  = "tag"
    value = "ospf-area0"
  }
}

<<<<<<< HEAD
#Build OSPF network statements dynamically from the tagged prefixes
#All matched prefixes are /30 links, so the wildcard is fixed at 0.0.0.3

locals {
  ospf_area0_networks = [
=======
# Build the OSPF network statement list dynamically from the tagged prefixes
# Netbox returns e.g. 10.0.12.0/30 - iosxe networks need the base IP, a wildcard
# mask and an area, so pull the address portion out of the CIDR here.

locals {
  ospf_networks = [
>>>>>>> 51920d909a9887a6a4f4b167d1b2358c63bb2198
    for p in data.netbox_prefixes.ospf_area0.prefixes : {
      ip       = split("/", p.prefix)[0]
      wildcard = "0.0.0.3"
      area     = "0"
    }
  ]
<<<<<<< HEAD
}

#OSPF process 1, area 0
#Router ID comes from each router's loopback (local.Rx_lo_ip)
#The same area0 network list is applied to all routers - OSPF only
#activates it on interfaces whose IP actually falls in one of these
#network/wildcard ranges, so the superset list is safe on every router
#auto_cost_reference_bandwidth is managed here so drift from the default
#(or from out-of-band CLI changes) is detected and corrected by Terraform
=======

  # Explicit reference bandwidth (Mbps) so cost calculations stay meaningful on
  # multi-gig links and so drift from manual "auto-cost reference-bandwidth"
  # changes on-box is caught and reverted by Terraform.
  ospf_reference_bandwidth = 100000
}
>>>>>>> 51920d909a9887a6a4f4b167d1b2358c63bb2198

resource "iosxe_ospf" "R1" {
  provider                      = iosxe.R1
  process_id                    = 1
  router_id                     = local.R1_lo_ip
<<<<<<< HEAD
  networks                      = local.ospf_area0_networks
  auto_cost_reference_bandwidth = var.ospf_reference_bandwidth
=======
  networks                      = local.ospf_networks
  auto_cost_reference_bandwidth = local.ospf_reference_bandwidth
>>>>>>> 51920d909a9887a6a4f4b167d1b2358c63bb2198
}

resource "iosxe_ospf" "R2" {
  provider                      = iosxe.R2
  process_id                    = 1
  router_id                     = local.R2_lo_ip
<<<<<<< HEAD
  networks                      = local.ospf_area0_networks
  auto_cost_reference_bandwidth = var.ospf_reference_bandwidth
=======
  networks                      = local.ospf_networks
  auto_cost_reference_bandwidth = local.ospf_reference_bandwidth
>>>>>>> 51920d909a9887a6a4f4b167d1b2358c63bb2198
}

resource "iosxe_ospf" "R3" {
  provider                      = iosxe.R3
  process_id                    = 1
  router_id                     = local.R3_lo_ip
<<<<<<< HEAD
  networks                      = local.ospf_area0_networks
  auto_cost_reference_bandwidth = var.ospf_reference_bandwidth
=======
  networks                      = local.ospf_networks
  auto_cost_reference_bandwidth = local.ospf_reference_bandwidth
>>>>>>> 51920d909a9887a6a4f4b167d1b2358c63bb2198
}
