#Query Management IPs for each router from netbox

data "netbox_ip_addresses" "R1_mgmt" {
  filter {
    name  = "ip_address"
    value = "10.0.0.1/24"
  }
}

data "netbox_ip_addresses" "R2_mgmt" {
  filter {
    name  = "ip_address"
    value = "10.0.0.2/24"
  }
}

data "netbox_ip_addresses" "R3_mgmt" {
  filter {
    name  = "ip_address"
    value = "10.0.0.3/24"
  }
}

#Query Loopback IP's from Netbox

data "netbox_ip_addresses" "R1_lo" {
  filter {
    name  = "ip_address"
    value = "1.1.1.1/32"
  }
}

data "netbox_ip_addresses" "R2_lo" {
  filter {
    name  = "ip_address"
    value = "2.2.2.2/32"
  }
}

data "netbox_ip_addresses" "R3_lo" {
  filter {
    name  = "ip_address"
    value = "3.3.3.3/32"
  }
}


#Extract Clean IPs - remove the prefix length

locals {
  R1_ip    = split("/", data.netbox_ip_addresses.R1_mgmt.ip_addresses[0].ip_address)[0]
  R2_ip    = split("/", data.netbox_ip_addresses.R2_mgmt.ip_addresses[0].ip_address)[0]
  R3_ip    = split("/", data.netbox_ip_addresses.R3_mgmt.ip_addresses[0].ip_address)[0]
  R1_lo_ip = split("/", data.netbox_ip_addresses.R1_lo.ip_addresses[0].ip_address)[0]
  R2_lo_ip = split("/", data.netbox_ip_addresses.R2_lo.ip_addresses[0].ip_address)[0]
  R3_lo_ip = split("/", data.netbox_ip_addresses.R3_lo.ip_addresses[0].ip_address)[0]
}
