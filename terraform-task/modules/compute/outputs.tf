#-----compute/outputs.tf-----
#=============================

output "instance_name" {
  value = aws_instance.db-srv001.tags.Name
}

output "server_public_ip" {
  value = aws_instance.db-srv001.public_ip
}

output "server_private_ip" {
  value = aws_instance.db-srv001.private_ip
}

output "root_password" {
  value = random_password.password.result
}