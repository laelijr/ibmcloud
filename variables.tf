#############ENVIRONMEN#############

variable "environment_name" {
    type        = string
    default = "tflab"
    description = "To be used on resources names"
}

variable "environment_kind" {
    type        = string
    default = "Lab"
    description = "What envirnment is that?"
}

###############LOCATION#############

variable "location" {
  default = "ca-tor"
}

###############NETWORK#############
variable "vpc-cidr" {
  description = "VPC's CIDR"
  default     = "10.0.1.0/16"
}

variable "fw-cidr" {
  description = "Firewall's CIDR"
  default     = "10.0.2.0/16"
}

variable "allow-internet" {
  description = "Provide access to the internet"
  default     = "0.0.0.0/0"
}


variable "machine-size" {
  description = "machine size"
  default     = "cx2-2x4"
}

variable "port-speed" {
  description = "vm port speed"
  default     = "1000"
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "ssh-key" {
  description = "ssh public key"
  default     = ""
}


####################
####################
####################

variable "iaasapikey" {
  description = "The IBM Cloud infrastructure API key"
  default     = ""
}

variable "paasapikey" {
  description = "The IBM Cloud platform API key"
  default     = ""
}

variable "iaasusername" {
  description = "The IBM Cloud infrastructure user name"
  default     = ""
}

variable "ibm-region" {
  description = "IBM Cloud region"
  default     = ""
}

variable "availability-zone" {
  description = "location to deploy"
  default     = ""
}

variable "resource-group" {
  description = "resource group"
  default     = "vpc-test"
}

variable "address-prefix" {
  description = "address prefix used in vpc"
  default     = "172.21.0.0/21"
}

variable "access-to-any-ip" {
  description = "Give access to any ip"
  default     = "0.0.0.0/0"
}

variable "image-template-id" {
  description = "Image template id used for VM, use windows image. Use command `ibmcloud is images` to view list of available images."
  default     = "r006-54e9238a-ffdd-4f90-9742-7424eb2b9ff1"  
}

variable "machine-type" {
  description = "VM machine type"
  default     = "cx2-2x4"
}

variable "subnet-cidr" {
  description = "Used for creating subnet with given cidr"
  default     = "172.21.0.0/24"
}

variable "security-group-port" {
  description = "Used for adding rule for security group"
  default     = 3389
}

variable "ACLsource-ingress" {
  description = "Used for creating ACL source ingress cidr"
  default     = "0.0.0.0/0"
}

variable "ACLdest-ingress" {
  description = "Used for creating ACL destination ingress cidr"
  default     = "0.0.0.0/0"
}

variable "ACLsource-egress" {
  description = "Used for creating ACL source egress cidr"
  default     = "0.0.0.0/0"
}

variable "ACLdest-egress" {
  description = "Used for creating ACL destination egress cidr"
  default     = "0.0.0.0/0"
}

variable "tcp-max-port" {
  description = "The highest port in the range of ports to be matched"
  default     = 65535
}

variable "tcp-min-port" {
  description = "The highest port in the range of ports to be matched"
  default     = 1
}