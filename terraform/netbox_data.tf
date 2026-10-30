<<<<<<< HEAD
#Query Management IPs for each router from netbox
=======
# Query Management IP's for each router from Netbox
>>>>>>> 51920d909a9887a6a4f4b167d1b2358c63bb2198

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

<<<<<<< HEAD
#Query Loopback IP's from Netbox
=======
#Query Loopback Ip's from Netbox
>>>>>>> 51920d909a9887a6a4f4b167d1b2358c63bb2198

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


<<<<<<< HEAD
#Extract Clean IPs - remove the prefix length
=======
#   Extract clean IP's - Netbox returns 10.0.0.1/24 but iosxe needs 10.0.0.1
>>>>>>> 51920d909a9887a6a4f4b167d1b2358c63bb2198

locals {
  R1_ip    = split("/", data.netbox_ip_addresses.R1_mgmt.ip_addresses[0].ip_address)[0]
  R2_ip    = split("/", data.netbox_ip_addresses.R2_mgmt.ip_addresses[0].ip_address)[0]
  R3_ip    = split("/", data.netbox_ip_addresses.R3_mgmt.ip_addresses[0].ip_address)[0]
  R1_lo_ip = split("/", data.netbox_ip_addresses.R1_lo.ip_addresses[0].ip_address)[0]
  R2_lo_ip = split("/", data.netbox_ip_addresses.R2_lo.ip_addresses[0].ip_address)[0]
  R3_lo_ip = split("/", data.netbox_ip_addresses.R3_lo.ip_addresses[0].ip_address)[0]
}
