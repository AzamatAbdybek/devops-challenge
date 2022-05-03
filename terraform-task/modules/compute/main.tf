#-----compute/main.tf-----
#==========================
provider "aws" {
  region = var.region
}


#Create instance db-srv001
#===============================
resource "aws_instance" "db-srv001" {
 ami                         = "ami-04505e74c0741db8d"
 instance_type               = var.machine_type
 key_name                    = "key-db-srv001"
 associate_public_ip_address = var.public_ip_required ? true : false
 vpc_security_group_ids      = [var.security_group]
 subnet_id                   = var.subnets
           


provisioner "remote-exec" {
  inline = [
  "echo '${random_password.password.result}' | chpasswd"
  ]
  connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key   = file(var.ssh_key_private)
      host        = self.public_ip
  }
}


  tags = {
    Name = "${var.instance_name}-${var.environment_code}-${random_string.random.result}"
    Environment_code = var.environment_code
  }
}


resource "random_string" "random" {
  length           = 4
  special          = true
  override_special = "/@£$"
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}


