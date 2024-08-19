resource "ansible_playbook" "playbook" {
  playbook   = "./ansible/playbook.yml"
  name       = sakuracloud_server.web_srv.ip_address
  replayable = true ### terraform applyの度に、Playbookを実行

  extra_vars = {
    ansible_user                 = "ubuntu"
    ansible_ssh_private_key_file = ".ssh/id_rsa_${var.env}"
    ansible_become               = true
    ansible_become_pass          = var.password
  }
}

output "args" {
  value = ansible_playbook.playbook.args
}

output "temp_inventory_file" {
  value = ansible_playbook.playbook.temp_inventory_file
}

output "playbook_stderr" {
  value = ansible_playbook.playbook.ansible_playbook_stderr
}

output "playbook_stdout" {
  value = ansible_playbook.playbook.ansible_playbook_stdout
}
