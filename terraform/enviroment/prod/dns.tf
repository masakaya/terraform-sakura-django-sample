data "sakuracloud_dns" "main" {
  filter {
    names = [var.domain]
  }
}

resource "sakuracloud_dns_record" "web" {
  dns_id = data.sakuracloud_dns.main.id
  name   = "www"
  type   = "CNAME"
  value  = "${sakuracloud_proxylb.main.fqdn}."
  ttl    = 10
}

resource "sakuracloud_dns_record" "mng" {
  dns_id = data.sakuracloud_dns.main.id
  name   = "mng"
  type   = "CNAME"
  value  = "${sakuracloud_proxylb.main.fqdn}."
  ttl    = 10
}
