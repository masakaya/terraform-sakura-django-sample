terraform {
  required_version = "1.9.3"
  required_providers {
    sakuracloud = {
      source  = "sacloud/sakuracloud"
      version = "2.25.5"
    }
  }
}

provider "sakuracloud" {
  alias = "default"
  zone  = var.default_zone
}
