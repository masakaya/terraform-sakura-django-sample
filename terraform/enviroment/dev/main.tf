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
  core        = each.value.core
  memory      = each.value.memory
  description = each.value.description
  hostname    = each.value.hostname
  password    = var.password
  ssh_key_ids = ["${sakuracloud_ssh_key_gen.main.id}"]
}

