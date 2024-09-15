resource "ansible_host" "servers" {
  for_each = local.servers
  name     = each.value.hostname
  groups   = [each.value.suffix]
  variables = {
    ansible_user                 = "ubuntu" // 必要に応じてユーザーを指定
    ansible_host                 = each.value.private_ip
    ansible_ssh_private_key_file = ".ssh/id_rsa" // 必要に応じてキーを指定
    ansible_python_interpreter   = "/usr/bin/python3"
    ansible_become               = "yes"
    ansible_become_method        = "sudo"
    ansible_become_pass          = var.password
  }
}
