resource "sakuracloud_internet" "router" {
  name        = "${var.service}-${var.env}-router"
  netmask     = 28
  band_width  = 100
  enable_ipv6 = false
}
