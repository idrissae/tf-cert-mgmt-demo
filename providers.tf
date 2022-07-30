


terraform {
  required_providers {
    bigip = {
      source = "F5Networks/bigip"
      version = "1.14.0"
    }
  }
}



provider "bigip" {
  address  = var.bigip_hostname
  username = var.admin_username
  password = var.admin_password
}