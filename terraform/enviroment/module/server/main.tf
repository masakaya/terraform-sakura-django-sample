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
    upstream = "shared"
    #upstream        = sakuracloud_switch.main.id
    #user_ip_address = var.server.web.private_ip
  }
  # USER:ubuntu
  # Change root : sudo su - 
  # Password
  disk_edit_parameter {
    hostname        = var.suffix
    password        = var.password
    ssh_key_ids     = var.ssh_key_ids
    disable_pw_auth = true //パスワードでのログインを
  }
}
