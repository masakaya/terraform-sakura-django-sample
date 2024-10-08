terraform {
  # さくらインターネット用オブジェクトストレージ
  backend "s3" {
    bucket = "masakaya-tfstate"
    key    = "project_name/env/dev/terraform.common.tfstate"
    region = "jp-north-1"
    endpoints = {
      s3 = "https://s3.isk01.sakurastorage.jp"
    }
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_region_validation      = true
    skip_metadata_api_check     = true
    skip_s3_checksum            = true
  }
}
