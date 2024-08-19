variable "password" {
  default   = "p@ssw0rd"
  type      = string
  sensitive = true
}

variable "default_region" {
  type        = string
  default     = "jp-north-1"
  description = "さくらのデフォルトリージョン"
}

variable "s3_endpoint" {
  type        = string
  default     = "https://s3.isk01.sakurastorage.jp"
  description = "さくらのS3バケットのリージョン(石狩第１)"
}

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
