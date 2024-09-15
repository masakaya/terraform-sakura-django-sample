module "server" {
  providers = {
    sakuracloud = sakuracloud.default
  }
  for_each    = local.servers
  service     = var.service
  env         = var.env
  source      = "../module/server"
  zone        = var.default_zone
  suffix      = each.value.suffix
  disk_size   = each.value.disk_size
  switch_id   = each.value.switch_id
  gateway     = each.value.gateway
  private_ip  = each.value.private_ip
  filter_id   = each.value.filter_id
  core        = each.value.core
  memory      = each.value.memory
  description = each.value.description
  hostname    = each.value.hostname
  password    = var.password
  ssh_key_ids = ["${sakuracloud_ssh_key_gen.main.id}"]
}

 # SSL証明書を発行します。
module "acme" {
  providers = {
    sakuracloud = sakuracloud.default
  }
  source = "../module/acme"
  common_name = var.domain
  subject_alternative_names = var.subject_alternative_names
  email_address =  var.ssl_reg_email_address
}
