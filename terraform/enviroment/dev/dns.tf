resource "sakuracloud_dns" "main" {
  zone = var.domain
}

resource "sakuracloud_dns_record" "main" {
  dns_id = sakuracloud_dns.main.id
  name   = "www"
  type   = "A"
  value  = var.server.web.private_ip

}
