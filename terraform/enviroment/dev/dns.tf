resource "sakuracloud_dns" "main" {
  zone = var.domain
}

resource "sakuracloud_dns_record" "main" {
  dns_id = sakuracloud_dns.main.id
  name   = "@"
  type   = "A"
  value  = sakuracloud_server.web_srv.ip_address
}
