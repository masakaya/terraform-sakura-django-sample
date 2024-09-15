variable "email_address" {
  type        = string
  description = "Let's encriptionに登録するメールアドレス"
}

variable "common_name" {
  type        = string
  description = "共通名(Common Names)"
}

variable "subject_alternative_names" {
  type        = list(string)
  description = "SAN list"
}

variable "zone" {
  type        = string
  default     = "is1b"
  description = "zone time(default:石狩第2)"
}

