output "certificate_url" {
  value       = acme_certificate.cert.certificate_url
  description = "The URL of the issued certificate."
}

output "certificate_domain" {
  value       = acme_certificate.cert.certificate_domain
  description = "The domain for which the certificate was issued."
}

output "private_key_pem" {
  value       = acme_certificate.cert.private_key_pem
  description = "The private key in PEM format associated with the certificate."
}

output "certificate_pem" {
  value       = acme_certificate.cert.certificate_pem
  description = "The issued certificate in PEM format."
}

output "issuer_pem" {
  value       = acme_certificate.cert.issuer_pem
  description = "The intermediate certificate in PEM format."
}
