terraform {
  required_version = "1.9.3"
  required_providers {
    sakuracloud = {
      source  = "sacloud/sakuracloud"
      version = "2.25.4"
    }
    ansible = {
      version = "~> 1.3.0"
      source  = "ansible/ansible"
    }
  }
}

provider "sakuracloud" {
  # using usacloud profile
  alias = "default"
  zone  = var.default_zone
}

provider "http" {}
