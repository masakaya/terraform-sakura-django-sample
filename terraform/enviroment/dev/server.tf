data "sakuracloud_archive" "ubuntu" {
  os_type = "ubuntu2004"
}

resource "sakuracloud_disk" "web" {
  name              = "example1_disk"
  size              = 20
  plan              = "ssd"
  connector         = "virtio"
  source_archive_id = data.sakuracloud_archive.ubuntu.id
}

# 作成するサーバを定義
resource "sakuracloud_server" "web_srv" {
  name        = "web_srv"
  disks       = [sakuracloud_disk.web.id]
  core        = 1
  memory      = 1
  description = "web server"


  # サーバのNICの接続先の定義。共有セグメント
  # ルータ+スイッチに置き換え予定
  network_interface {
    upstream = "shared"
  }

  disk_edit_parameter {
    hostname        = "web1"
    password        = var.password
    ssh_key_ids     = ["${sakuracloud_ssh_key_gen.main["web"].id}"]
    disable_pw_auth = true
  }
}
