terraform {
  required_version = "1.9.3"
  required_providers {
    sakuracloud = {
      source  = "sacloud/sakuracloud"
      version = "2.16.2"
    }
  }
}

provider "sakuracloud" {
  # using usacloud profile
  profile = "default"
  zone    = "is1a"
}