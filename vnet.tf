#############VPC#############
resource "ibm_is_vpc" "lab-vpc" {
  name            = "${var.environment_name}-vpc"
  resource_group  = ibm_resource_group.lab-rg.id
}

resource "ibm_is_vpc_address_prefix" "lab-vpc-address-prefix" {
  name        = "${var.environment_name}-lab-vpc-address-prefix"
  zone        = var.location
  vpc         = ibm_is_vpc.lab-vpc.id
	cidr        = var.vpc-cidr
	#is_default  = true
}

#############SUBNETS#############
resource "ibm_is_subnet" "main-lab-subnet" {
  name                     = "${var.environment_name}-main-lab-subnet"
  vpc                      = ibm_is_vpc.lab-vpc.id
  zone                     = var.location
  ipv4_cidr_block          = "10.0.3.0/24"
}

resource "ibm_is_subnet" "vpc-subnet" {
  name            = "terraform-vpc-subnet"
  vpc             = ibm_is_vpc.lab-vpc.id
  zone            = var.availability-zone
  ipv4_cidr_block = var.subnet-cidr
#  network_acl     = ""
}