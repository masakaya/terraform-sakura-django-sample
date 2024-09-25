locals {
  nfs = {
    plan = "ssd"
    size = "100"
    ip_address = "192.168.0.101"
    netmask = 24
    gateway = "192.168.0.1"
  }

  servers = {
    web = {
      suffix      = "web"
      disk_size   = 20 // 要件に応じて修正
      switch_id   = sakuracloud_internet.router.switch_id
      gateway     = sakuracloud_internet.router.gateway
      private_ip  = sakuracloud_internet.router.ip_addresses[2]
      filter_id   = sakuracloud_packet_filter.web.id
      core        = 1 // 要件に応じて修正
      memory      = 1 // 要件に応じて修正
      hostname    = "web-01"
      description = "Web Server"
      local_private_ip  = "192.168.0.10"
    }

    db = {
      suffix      = "db"
      disk_size   = 100 // 要件に応じて修正
      switch_id   = sakuracloud_internet.router.switch_id
      gateway     = sakuracloud_internet.router.gateway
      private_ip  = sakuracloud_internet.router.ip_addresses[9]
      filter_id   = sakuracloud_packet_filter.db.id
      core        = 2 // 要件に応じて修正
      memory      = 4 // 要件に応じて修正
      hostname    = "database-01"
      description = "Database server"
      local_private_ip  = "192.168.0.20"
    }

    mng = {
      suffix      = "mng"
      disk_size   = 20 // 要件に応じて修正
      switch_id   = sakuracloud_internet.router.switch_id
      gateway     = sakuracloud_internet.router.gateway
      private_ip  = sakuracloud_internet.router.ip_addresses[10]
      filter_id   = sakuracloud_packet_filter.mng.id
      core        = 1 // 要件に応じて修正
      memory      = 1 // 要件に応じて修正
      hostname    = "manage-01"
      description = "Management server"
      local_private_ip  = "192.168.0.30"
    }
  }
}
