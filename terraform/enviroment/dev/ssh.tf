resource "sakuracloud_ssh_key_gen" "main" {
  for_each    = var.ssh_key
  name        = each.value
  description = "sshkey for ${each.key} server"

  provisioner "local-exec" {
    command = "echo \"${self.private_key}\" > .ssh/id_rsa_${each.key}; chmod 0600 .ssh/id_rsa_${each.key}"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm -f .ssh/id_rsa_${each.key}"
  }
}
