resource "sakuracloud_nfs" "main" {
    name  = "${var.service}-${var.env}-nfs"

    plan = local.nfs.plan
    size = local.nfs.size

    network_interface {
        switch_id = sakuracloud_switch.nfs.id
        ip_address = local.nfs.ip_address
        netmask = local.nfs.netmask
        gateway = local.nfs.gateway
    }
    description = "Sakura Cloud NFS"
}

resource "sakuracloud_switch" "nfs" {
    name  = "${var.service}-${var.env}-nfs-sw"
    description = "Swich for nfs"
}



