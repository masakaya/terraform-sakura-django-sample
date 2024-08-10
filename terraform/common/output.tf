output "web_private_key" {
  value = sakuracloud_ssh_key_gen.main["web"].private_key
}

output "web_public_key" {
  value = sakuracloud_ssh_key_gen.main["web"].public_key
}

output "db_private_key" {
  value = sakuracloud_ssh_key_gen.main["db"].private_key
}

output "db_public_key" {
  value = sakuracloud_ssh_key_gen.main["db"].public_key
}
