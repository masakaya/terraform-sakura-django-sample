resource "sakuracloud_switch" "main" {
  name        = "${var.service}-${var.env}-sw"
  description = "Switch of ${var.env} for ${var.service}"
  zone        = var.default_zone
}
