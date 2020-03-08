resource "vsphere_virtual_machine" "vm" {
  count            		= "${var.vm_count}"
  name             		= "${var.vm_name}${count.index}"
  resource_pool_id 		= "${data.vsphere_resource_pool.pool.id}"
  datastore_id     		= "${data.vsphere_datastore.datastore.id}"
  wait_for_guest_net_timeout 	= "10"

  num_cpus = "${var.cpu_count}"
  memory   = "${var.RAM_count_MB}"
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size  = "${var.disk_size}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${var.vm_name}${count.index}"
        domain    = "${var.vm_name}${count.index}"
      }

      network_interface {
        ipv4_address = "${cidrhost(var.ipaddr, var.start_ip + count.index)}"
        ipv4_netmask = "${var.netmask}"
      }
      ipv4_gateway = "${var.gateway}"
    }
  }
}
