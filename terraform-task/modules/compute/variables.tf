#-----compute/variables.tf-----
#===============================
variable "region" {
  type    = string
  default = "us-east-1"
}

variable "security_group" {}

variable "subnets" {}

variable "environment_code" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "public_ip_required" {
  type = bool
  default = false
}

variable "ssh_key_private" {
  type    = string
  #Replace this with the location of you private key
  default = "/tmp/keys/key-db-srv001.pem"
}

variable "machine_type" {
  type = string
  default = "t2.micro"

  validation {
    condition     = can(regex("t2.micro|t2.small", var.machine_type))
    error_message = "Invalid Machine type option. You can specify only \"t2.micro\", \"t2.small\"."
  }
}


