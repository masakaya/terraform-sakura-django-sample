locals {
  servers = {
    web = {
      suffix      = "web"
      disk_size   = 20 // 要件に応じて修正
      switch_id   = sakuracloud_internet.router.switch_id
      gateway     = sakuracloud_internet.router.gateway
      private_ip  = sakuracloud_internet.router.ip_addresses[2]
      core        = 1 // 要件に応じて修正
      memory      = 1 // 要件に応じて修正
      hostname    = "web"
      description = "Web Server"
    }
    mng = {
      suffix      = "mng"
      disk_size   = 20 // 要件に応じて修正
      switch_id   = sakuracloud_internet.router.switch_id
      gateway     = sakuracloud_internet.router.gateway
      private_ip  = sakuracloud_internet.router.ip_addresses[4]
      core        = 1 // 要件に応じて修正
      memory      = 1 // 要件に応じて修正
      hostname    = "manage"
      description = "Management server"
    }
  }
}
