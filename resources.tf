#############PUBLIC LB#############


#############INTERNAL LB#############
resource "ibm_is_lb" "lab-lb" {
  name    = "${var.environment_name}-lab-lb"
  subnets = [ibm_is_subnet.main-lab-subnet.id]
}

resource "ibm_is_ssh_key" "sshkey" {
  name       = "ssh1"
  public_key = file(var.ssh_public_key)
}