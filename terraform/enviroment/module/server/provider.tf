// See. 
// https://discuss.hashicorp.com/t/using-a-non-hashicorp-provider-in-a-module/21841/11
terraform {
  required_version = "1.9.3"
  required_providers {
    sakuracloud = {
      source  = "sacloud/sakuracloud"
      version = "2.16.2"
    }
  }
}
