resource "sakuracloud_nfs" "main" {
    name  = "${var.service}-${var.env}-nfs"

    plan = "ssd"
    size = "100"

    network_interface {
        switch_id = sakuracloud_switch.nfs.id
        ip_address = "192.168.0.101"
        netmask = 24
        gateway = "192.168.0.1"
    }
    description = "Sakura Cloud NFS"
}

resource "sakuracloud_switch" "nfs" {
    name  = "${var.service}-${var.env}-nfs-sw"
    description = "Swich for nfs"
}



