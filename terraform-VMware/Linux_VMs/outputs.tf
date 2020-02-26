output "VM_name" {
  value = "${vsphere_virtual_machine.vm.*.name}"
}
output "IP_addresses" {
  value = "${vsphere_virtual_machine.vm.*.default_ip_address}"
}
