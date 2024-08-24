variable "domain" {
  type    = string
  default = "dev.ppscan.org"
}

variable "password" {
  default   = "p@ssw0rd"
  type      = string
  sensitive = true
}

variable "server" {
  type = map(object({
    private_ip = string
  }))
  default = {
    "web" = {
      "private_ip" = "192.168.0.10"
    }
  }
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

variable "default_zone" {
  type        = string
  description = "デフォルトゾーン"
  default     = "is1a" // 第一リージョン機能制限が入っているためis1b(石狩第２ゾーンが良い）
}
