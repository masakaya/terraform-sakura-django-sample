data "sakuracloud_archive" "ubuntu" {
  os_type = var.os
}

resource "sakuracloud_disk" "main" {
  name              = "${var.service}-${var.env}-${var.suffix}-disk"
  size              = var.disk_size
  plan              = "ssd"
  connector         = "virtio"
  source_archive_id = data.sakuracloud_archive.ubuntu.id
  zone              = var.zone
}

# 作成するサーバを定義
resource "sakuracloud_server" "main" {
  name        = "${var.service}-${var.env}-${var.suffix}"
  disks       = [sakuracloud_disk.main.id]
  core        = var.core
  memory      = var.memory
  description = var.description
  zone        = var.zone

  # ルータ+スイッチに置き換え予定
  network_interface {
    upstream        = var.switch_id
    user_ip_address = var.private_ip
  }
  # USER:ubuntu
  # Change root : sudo su - 
  # Password
  disk_edit_parameter {
    hostname        = var.suffix
    password        = var.password
    ssh_key_ids     = var.ssh_key_ids
    disable_pw_auth = true //パスワードでのログインを無効
    # Setup Network
    note {
      id = sakuracloud_note.netplan_setup.id
    }
  }
}

resource "sakuracloud_note" "netplan_setup" {
  name = "netplan-setup-script"
  tags = ["netplan", "setup"]

  content = <<EOF
#!/bin/bash
cat <<EOL > /etc/netplan/01-netcfg.yaml
network: 
  version: 2
  ethernets: 
    eth0: 
      dhcp4: 'no'
      dhcp6: 'no'
      addresses: 
        - ${var.private_ip}/${var.netmask}
      routes: 
        - to: default
          via: ${var.gateway}
      nameservers: 
        addresses: 
          - 8.8.8.8
          - 8.8.4.4
        search: 
          - localdomain
  renderer: networkd
EOL

sudo netplan apply
EOF
}
