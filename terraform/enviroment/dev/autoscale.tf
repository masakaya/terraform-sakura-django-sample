resource "sakuracloud_auto_scale" "main" {
  name  = "${var.service}-${var.env}-web-auto-scale"
  zones = [var.default_zone]

  config = jsonencode({
    resources : [{
      type : "Server",
      selector : {
        names : [module.server["web"].name],
        zones : [var.default_zone],
      },
    }],
  })
  api_key_id = var.api_key_id

  cpu_threshold_scaling {
    server_prefix = "${var.service}-${var.env}-web"
    up            = 80
    down          = 20
  }
}
