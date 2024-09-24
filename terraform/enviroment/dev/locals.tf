locals {
  nfs = {
    switch_id   = sakuracloud_internet.router.switch_id
    private_ip = sakuracloud_internet.router.ip_addresses[3]
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
      local_sw_id = sakuracloud_switch.nfs.id
      local_ip    = "192.168.0.10"
      local_netmask  = 24
      local_gateway  = "192.168.0.1"
    }

  #   db = {
  #     suffix      = "db"
  #     disk_size   = 100 // 要件に応じて修正
  #     switch_id   = sakuracloud_internet.router.switch_id
  #     gateway     = sakuracloud_internet.router.gateway
  #     private_ip  = sakuracloud_internet.router.ip_addresses[9]
  #     filter_id   = sakuracloud_packet_filter.web.id
  #     core        = 2 // 要件に応じて修正
  #     memory      = 4 // 要件に応じて修正
  #     hostname    = "database-01"
  #     description = "Database server"
  #   }

  #   mng = {
  #     suffix      = "mng"
  #     disk_size   = 20 // 要件に応じて修正
  #     switch_id   = sakuracloud_internet.router.switch_id
  #     gateway     = sakuracloud_internet.router.gateway
  #     private_ip  = sakuracloud_internet.router.ip_addresses[10]
  #     filter_id   = sakuracloud_packet_filter.mng.id
  #     core        = 1 // 要件に応じて修正
  #     memory      = 1 // 要件に応じて修正
  #     hostname    = "manage"
  #     description = "Management server"
  #   }
  }
}
