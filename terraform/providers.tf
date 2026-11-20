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
  api_token  = "nbt_ZN6yyXZfp9NM.iFn2TjVHtKBrBqtWNtoN1qSHXHthRuKW3iRYhqsD"
}

provider "iosxe" {
  alias    = "R1"
  host     = local.R1_ip
  username = "admin"
  password = "cisco"
  insecure = true
}

provider "iosxe" {
  alias    = "R2"
  host     = local.R2_ip
  username = "admin"
  password = "cisco"
  insecure = true
}

provider "iosxe" {
  alias    = "R3"
  host     = local.R3_ip
  username = "admin"
  password = "cisco"
  insecure = true
}

