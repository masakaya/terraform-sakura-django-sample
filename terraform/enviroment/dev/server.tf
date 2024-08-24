data "sakuracloud_archive" "ubuntu" {
  # Ubuntu 2024 LTE
  os_type = "ubuntu"
}

resource "sakuracloud_disk" "web" {
  name              = "web_disk"
  size              = 20
  plan              = "ssd"
  connector         = "virtio"
  source_archive_id = data.sakuracloud_archive.ubuntu.id
  zone              = var.default_zone
}

# 作成するサーバを定義
resource "sakuracloud_server" "web_srv" {
  name        = "${var.service}-${var.env}web_srv"
  disks       = [sakuracloud_disk.web.id]
  core        = 1
  memory      = 1
  description = "web server"
  zone        = var.default_zone

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
    hostname        = "web1"
    password        = var.password
    ssh_key_ids     = ["${sakuracloud_ssh_key_gen.main.id}"]
    disable_pw_auth = true
  }
}
