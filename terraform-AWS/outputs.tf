#----root/outputs.tf-----

#----storage outputs------
output "Bucket_Name" {
  value = module.storage.bucketname
}

#---Compute Outputs ------

output "Public_Instance_IDs" {
  value = module.compute.server_id
}

output "Public_Instance_IPs" {
  value = module.compute.server_ip
}

