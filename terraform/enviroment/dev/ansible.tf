# Webサーバーのansible_hostを指定
resource "ansible_host" "web" {
  depends_on = [module.server["web"]]
  name       = "web01"
  groups     = ["web"]
  variables = {
    ansible_user                 = "ubuntu"
    ansible_host                 = module.server["web"].ip_address
    ansible_ssh_private_key_file = ".ssh/id_rsa_${var.env}"
    ansible_python_interpreter   = "/usr/bin/python3"
    ansible_become               = "yes"
    ansible_become_method        = "sudo"
    ansible_become_pass          = var.password
  }
}

# Webサーバーのansible_hostを指定
resource "ansible_host" "mng" {
  depends_on = [module.server["mng"]]
  name       = "mng"
  groups     = ["mng"]
  variables = {
    ansible_user                 = "ubuntu"
    ansible_host                 = module.server["mng"].ip_address
    ansible_ssh_private_key_file = ".ssh/id_rsa_${var.env}"
    ansible_python_interpreter   = "/usr/bin/python3"
    ansible_become               = "yes"
    ansible_become_method        = "sudo"
    ansible_become_pass          = var.password
  }
}


# output "args" {
#   value = ansible_playbook.playbook.args
# }

# output "temp_inventory_file" {
#   value = ansible_playbook.playbook.temp_inventory_file
# }

# output "playbook_stderr" {
#   value = ansible_playbook.playbook.ansible_playbook_stderr
# }

# output "playbook_stdout" {
#   value = ansible_playbook.playbook.ansible_playbook_stdout
# }
