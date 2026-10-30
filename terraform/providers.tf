terraform {
  required_providers {
    iosxe = {
      source  = "CiscoDevNet/iosxe"
      version = "~> 0.5"
    }
<<<<<<< HEAD

=======
>>>>>>> 51920d909a9887a6a4f4b167d1b2358c63bb2198
    netbox = {
      source  = "e-breuninger/netbox"
      version = "~> 5.6"
    }
  }
}
<<<<<<< HEAD

provider "netbox" {
  server_url = "http://10.0.0.100:8000"
  api_token  = "nbt_ZN6yyXZfp9NM.iFn2TjVHtKBrBqtWNtoN1qSHXHthRuKW3iRYhqsD"
=======
provider "netbox" {
  server_url = "http://10.0.0.100:8000"
  api_token  = "nbt_0SM00Ct62itA.B9QryWlWd4u2AXl4tEO3sOnF16DDLuQ8Rdt4DbVL"
>>>>>>> 51920d909a9887a6a4f4b167d1b2358c63bb2198
}

provider "iosxe" {
  alias    = "R1"
  host     = local.R1_ip
  username = "admin"
<<<<<<< HEAD
  password = "cisco"
=======
  password = "cisco123"
>>>>>>> 51920d909a9887a6a4f4b167d1b2358c63bb2198
  insecure = true
}

provider "iosxe" {
  alias    = "R2"
  host     = local.R2_ip
  username = "admin"
<<<<<<< HEAD
  password = "cisco"
=======
  password = "cisco123"
>>>>>>> 51920d909a9887a6a4f4b167d1b2358c63bb2198
  insecure = true
}

provider "iosxe" {
  alias    = "R3"
  host     = local.R3_ip
  username = "admin"
<<<<<<< HEAD
  password = "cisco"
  insecure = true
}


=======
  password = "cisco123"
  insecure = true
}

>>>>>>> 51920d909a9887a6a4f4b167d1b2358c63bb2198
