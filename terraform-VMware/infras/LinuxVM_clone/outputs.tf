# outputs from created resources
output "VM_name" {
  value = "${module.linux_machine.VM_name}"
}
output "IP_addresses" {
  value = "${module.linux_machine.IP_addresses}"
}
