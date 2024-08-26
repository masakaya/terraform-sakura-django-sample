locals {
  servers = {
    web = {
      suffix      = "web"
      disk_size   = 20 // 要件に応じて修正
      switch_id   = "" // 未使用 Route + LB が追加されたら検証する
      private_ip  = "192.168.0.10"
      core        = 1 // 要件に応じて修正
      memory      = 1 // 要件に応じて修正
      hostname    = "web"
      description = "Web Server"
    }
    mng = {
      suffix      = "mng"
      disk_size   = 20 // 要件に応じて修正
      switch_id   = "" // 未使用 Route + LB が追加されたら検証する
      private_ip  = "192.168.0.100"
      core        = 1 // 要件に応じて修正
      memory      = 1 // 要件に応じて修正
      hostname    = "manage"
      description = "Management server"
    }
  }
}
