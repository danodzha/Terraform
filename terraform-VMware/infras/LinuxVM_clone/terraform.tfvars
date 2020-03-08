datacenter_name = "LAB"
datastore_name  = "datastore1"
resources_name  = "Resources"
network_name    = "Public_PG"
template_name   = "CentOS7.template"
vm_name         = "terraform-test-VM"
vm_count        = "2"
cpu_count       = "2"
RAM_count_MB    = "1024"
disk_size       = "16"

# Give the IP address in the full format with CIDR. Example ipaddr = "10.0.0.1/24"
ipaddr = "69.39.238.128/24"

# Give the value for the last octet "X" of the IP. Example - start_ip = "15", this will assign IP of 10.0.0.15
# Leave blank if DHCP
start_ip = "128"

# Give netmask value in CIDR format
netmask = "8"

# Give you gateway address 
gateway          = "69.65.43.142"
vcenter_user     = "Administrator@vsphere.local"
vcenter_password = "Num4-1392I3"
vcenter_name     = "vcenter.learn-it.xyz"
