resource "sakuracloud_ssh_key_gen" "main" {
  name        = "${var.service}_${var.env}_ssh"
  description = "sshkey for ${var.env} server"

  provisioner "local-exec" {
    command = "echo \"${self.private_key}\" > .ssh/id_rsa_${var.env}; chmod 0600 .ssh/id_rsa_${var.env}"
  }

  # provisioner "local-exec" {
  #   when    = destroy
  #   command = "rm -f .ssh/id_rsa_${var.env}"
  # }
}

resource "null_resource" "destroy_key" {
  triggers = {
    file = ".ssh/id_rsa_${var.env}"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm -f \"${self.triggers.file}\""
  }
}

