# スケールするサーバー
module "scale_server" {
  providers = {
    sakuracloud = sakuracloud.default
  }
  count             = local.scale_server.server_count
  service           = var.service
  env               = var.env
  source            = "../module/server"
  zone              = var.default_zone
  suffix            = format("${local.scale_server.suffix}-%s", count.index + 1)
  disk_size         = local.scale_server.disk_size
  switch_id         = local.scale_server.switch_id
  gateway           = local.scale_server.gateway
  private_ip        = sakuracloud_internet.router.ip_addresses[count.index]
  filter_id         = local.scale_server.filter_id
  core              = local.scale_server.core
  memory            = local.scale_server.memory
  description       = format("${local.scale_server.description}", count.index + 1)
  disk_plan         = local.scale_server.disk_plan
  hostname          = format("${local.scale_server.hostname}", count.index + 1)
  password          = var.password
  ssh_key_ids       = ["${sakuracloud_ssh_key_gen.main.id}"]
  local_sw_id       = sakuracloud_switch.nfs.id
  local_private_ip  = cidrhost(local.scale_server.local_private_cidr, count.index + 2) // 192.168.0.2からスタートするため
  local_netmask     = local.nfs.netmask
  local_gateway     = local.nfs.gateway
  private_filter_id = sakuracloud_packet_filter.private.id
}

# スケールしないサーバー（バッチ、DB、管理サーバー）
module "server" {
  providers = {
    sakuracloud = sakuracloud.default
  }
  for_each          = local.servers
  service           = var.service
  env               = var.env
  source            = "../module/server"
  zone              = var.default_zone
  suffix            = each.value.suffix
  disk_size         = each.value.disk_size
  switch_id         = each.value.switch_id
  gateway           = each.value.gateway
  private_ip        = each.value.private_ip
  filter_id         = each.value.filter_id
  core              = each.value.core
  memory            = each.value.memory
  description       = each.value.description
  disk_plan         = each.value.disk_plan
  hostname          = each.value.hostname
  password          = var.password
  ssh_key_ids       = ["${sakuracloud_ssh_key_gen.main.id}"]
  local_sw_id       = sakuracloud_switch.nfs.id
  local_private_ip  = each.value.local_private_ip
  local_netmask     = local.nfs.netmask
  local_gateway     = local.nfs.gateway
  private_filter_id = sakuracloud_packet_filter.private.id
}

## ACMSの払い出し
module "acme" {
  providers = {
    sakuracloud = sakuracloud.default
  }
  source                    = "git::https://github.com/masakaya/terraform-acme-module.git//sakura?ref=v0.3.0"
  common_name               = "*.${var.domain}"
  subject_alternative_names = var.subject_alternative_names
  email_address             = var.ssl_reg_email_address
}
