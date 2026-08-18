
resource "iosxe_interface_loopback" "R1_lo0" {
  provider          = iosxe.R1
  name              = 0
  ipv4_address      = local.R1_lo_ip
  ipv4_address_mask = "255.255.255.255"
}

resource "iosxe_interface_loopback" "R2_lo0" {
  provider          = iosxe.R2
  name              = 0
  ipv4_address      = local.R2_lo_ip
  ipv4_address_mask = "255.255.255.255"
}

resource "iosxe_interface_loopback" "R3_lo0" {
  provider          = iosxe.R3
  name              = 0
  ipv4_address      = local.R3_lo_ip
  ipv4_address_mask = "255.255.255.255"
}
