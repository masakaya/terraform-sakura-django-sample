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
  description = "sakura switch id (unused)"
}

variable "private_ip" {
  type        = string
  default     = ""
  description = "private ip of server (unused)"
}

variable "core" {
  type        = number
  default     = "1"
  description = "server core number(vCPU)"
}

variable "ram" {
  type        = number
  default     = "1"
  description = "server core number(GB)"
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
