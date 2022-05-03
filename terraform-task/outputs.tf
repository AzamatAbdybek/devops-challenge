#-----outputs.tf-----
#====================
output "vm_name" {
  value = module.compute.instance_name
}

output "Public_IP_address" {
  value = module.compute.server_public_ip
}

output "Private_IP_address" {
  value = module.compute.server_private_ip
}

output "New_root_password" {
  sensitive = true
  value = module.compute.root_password
}
