# Create VPC ssh-key in given zone. We require ssh key for privisioning VM.
resource "ibm_is_ssh_key" "vpc-sshkey" {
  name       = "vpc-sshkey"
  public_key = var.ssh-key
}

# This terrform file has script to deploy virtual server on VPC. 
# Required attributes:
# name: name of vsi. Length 15 characters
# image: os image id.
# profile: machine type.
# subnet: vpc subnet id. e.x: "61a3af2e-a66e-4f36-a27e-e71cb537121d"
# vpc: deployed vpc id. e.x: ebfdb465-04a2-4668-a513-4f86fde6320f
# zone: zone in which vsi will be deployed to. Should be same as vpc zone. e.x: "eu-de-3"
# key: vpc ssh key. e.x:["636f6d70-0000-0001-0000-00000015d753"]
# user_data: upload bash file with IoT application.  
resource "ibm_is_instance" "vpc-vm" {
  name    = "vpc-windows-vm"
  image   = var.image-template-id
  profile = var.machine-type
  primary_network_interface {
    port_speed      = var.port-speed
    subnet          = ibm_is_subnet.vpc-subnet.id
    security_groups = [ibm_is_vpc.lab-vpc.default_security_group]
  }
  vpc  = ibm_is_vpc.lab-vpc.id
  zone = var.availability-zone
  keys = [ibm_is_ssh_key.vpc-sshkey.id]
}

# Reserve a floating IP and associate it to the network interface of 
# a virtual server instance to allow public traffic to the instance.
resource "ibm_is_floating_ip" "vpc-floating-ip" {
  name   = "vpc-floating-ip"
  target = ibm_is_instance.vpc-vm.primary_network_interface[0].id
}
