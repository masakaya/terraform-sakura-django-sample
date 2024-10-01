resource "sakuracloud_proxylb" "main" {
  name           = "${var.service}-${var.env}-proxylb"
  plan           = 500
  vip_failover   = true  # default: false
  sticky_session = false # ラウンドロビンで動作させるため、sessionによる経路固定は指定
  gzip           = true  # 圧縮
  proxy_protocol = true  # HTTP/2を有効にする
  region         = var.lb_region

  health_check {
    protocol    = "tcp"
    delay_loop  = 10
  }

  bind_port {
    proxy_mode        = "http"
    port              = 80
    redirect_to_https = true
  }

  bind_port {
    proxy_mode = "https"
    port       = 443
  }


  # syslog
  # syslog {
  #   server = module.server["mng"].ip_address
  #   port   = 514
  # }

  server {
    ip_address = module.server["web"].ip_address
    port       = 443
    group      = "group1"
  }

  # certificate {
  #  #   common_name       = var.domain
  #   server_cert       = module.acme.certificate_pem
  #   private_key       = module.acme.private_key_pem
  #   intermediate_cert = module.acme.issuer_pem
  # }

}

# resource "sakuracloud_proxylb_acme" "main" {
#   proxylb_id = sakuracloud_proxylb.main.id
#   accept_tos = true
#   #common_name      = sakuracloud_proxylb.main.vip
#   common_name       = "www.${var.domain}"
#   subject_alt_names = var.subject_alternative_names

#   update_delay_sec = 120
#   #get_certificates_timeout_sec = 120 

# }


