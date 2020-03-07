# vcenter connection
variable "vcenter_user" {}
variable "vcenter_password" {}
variable "vcenter_name" {}

# resource details variables
variable "datacenter_name" {}
variable "datastore_name" {}
variable "resources_name" {}
variable "network_name" {}
variable "template_name" {}
variable "vm_name" {}
variable "cpu_count" {}
variable "RAM_count_MB" {}
variable "disk_size" {}
variable "ipaddr" {}
variable "start_ip" {}
variable "netmask" {}
variable "gateway" {}
variable "vm_count" {}

# module for VM clonning
module "linux_machine" {
  source          = "../../"
  datacenter_name = "${var.datacenter_name}"
  datastore_name  = "${var.datastore_name}"
  resources_name  = "${var.resources_name}"
  network_name    = "${var.network_name}"
  template_name   = "${var.template_name}"
  vm_count        = "${var.vm_count}"
  vm_name         = "${var.vm_name}"
  cpu_count       = "${var.cpu_count}"
  RAM_count_MB    = "${var.RAM_count_MB}"
  disk_size       = "${var.disk_size}"
  ipaddr          = "${var.ipaddr}"
  start_ip        = "${var.start_ip}"
  netmask         = "${var.netmask}"
  gateway         = "${var.gateway}"
}
