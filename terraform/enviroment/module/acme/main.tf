resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.email_address
}

resource "acme_certificate" "cert" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = var.common_name

  dns_challenge {
    provider = "sakuracloud"
    config = {
    #    SAKURACLOUD_ACCESS_TOKEN="aaa"
    #    SAKURACLOUD_ACCESS_TOKEN_SECRET="bbb"
        SAKURACLOUD_TTL=120
    }
  }
}