resource "ibm_resource_group" "lab-rg" {
  name     = "${var.environment_name}-lab-rg"
}