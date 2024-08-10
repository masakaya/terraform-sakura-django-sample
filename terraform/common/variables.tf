variable "project_name" {
  type    = string
  default = "sample"
}

variable "env" {
  type    = string
  default = "common"
}

variable "ssh_key" {
  type = map(string)
  default = {
    web = "sshweb"
    db  = "sshdb"
  }
}
