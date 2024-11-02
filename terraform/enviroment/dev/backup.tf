resource "sakuracloud_auto_backup" "database" {
  name           = "${var.service}-${var.env}-db-backup"
  disk_id        = module.server["db"].disk_id
  weekdays       = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"]
  max_backup_num = 1
  description    = "Database backup"
}