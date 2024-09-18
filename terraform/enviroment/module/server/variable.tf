variable "service" {
  type        = string
  description = "サービス名"
  default     = "sample"
}

variable "env" {
  type        = string
  description = "環境名"
  default     = "dev"
}

variable "zone" {
  type        = string
  default     = "is1b"
  description = "zone time(default:石狩第2)"
}

variable "os" {
  type        = string
  default     = "ubuntu"
  description = "os type(default:Ubuntu latest)"
}

variable "suffix" {
  type        = string
  default     = "srv"
  description = "server suffix"
}

variable "disk_size" {
  type        = number
  default     = "20"
  description = "disk size"
}

variable "switch_id" {
  type        = string
  default     = ""
  description = "sakura switch id"
}

variable "private_ip" {
  type        = string
  default     = ""
  description = "private ip of server"
}

variable "gateway" {
  type        = string
  description = "gateway of server"
}

variable "netmask" {
  type        = number
  default     = 28
  description = "router's netmask"
}

variable "core" {
  type        = number
  default     = "1"
  description = "server core number(vCPU)"
}

variable "memory" {
  type        = number
  default     = "1"
  description = "server memory size(GB)"
}

variable "tags" {
  type       = list(string)
  default    = []
  description = "タグ（サーバーグループとしても利用する）"
}

variable "description" {
  type        = string
  default     = ""
  description = "description of the server"
}

variable "hostname" {
  type        = string
  default     = ""
  description = "sakura server hostname"
}

variable "password" {
  type        = string
  sensitive   = true
  description = "root password"
}

variable "ssh_key_ids" {
  type        = list(string)
  description = "ssh key ids"
}

variable "filter_id" {
  type        = string
  description = "server of packet filter rules"
}
