
resource "ibm_is_security_group_rule" "security_group_rule_tcp" {
  group     = ibm_is_vpc.lab-vpc.default_security_group
  direction = "inbound"
  remote    = var.allow-internet
  tcp {
    port_min = var.security-group-port
    port_max = var.security-group-port
  }
}