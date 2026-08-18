terraform {
  required_providers {
    iosxe = {
      source  = "CiscoDevNet/iosxe"
      version = "~> 0.5"
    }
    netbox = {
      source  = "e-breuninger/netbox"
      version = "~> 5.6"
    }
  }
}
provider "netbox" {
  server_url = "http://10.0.0.100:8000"
  api_token  = "nbt_0SM00Ct62itA.B9QryWlWd4u2AXl4tEO3sOnF16DDLuQ8Rdt4DbVL"
}

provider "iosxe" {
  alias    = "R1"
  host     = local.R1_ip
  username = "admin"
  password = "cisco123"
  insecure = true
}

provider "iosxe" {
  alias    = "R2"
  host     = local.R2_ip
  username = "admin"
  password = "cisco123"
  insecure = true
}

provider "iosxe" {
  alias    = "R3"
  host     = local.R3_ip
  username = "admin"
  password = "cisco123"
  insecure = true
}

