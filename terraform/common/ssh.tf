resource "sakuracloud_ssh_key_gen" "main" {
  for_each    = var.ssh_key
  name        = each.value
  description = "sshkey for ${each.key} server"
}
