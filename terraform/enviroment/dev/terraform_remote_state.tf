data "terraform_remote_state" "ssh" {
  backend = "s3"
  config = {
    bucket = "masakaya-tfstate"
    key    = "project_name/common/terraform.tfstate"
    region = var.default_region
    endpoints = {
      s3 = var.s3_endpoint
    }
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_region_validation      = true
    skip_metadata_api_check     = true
    skip_s3_checksum            = true
  }
}
