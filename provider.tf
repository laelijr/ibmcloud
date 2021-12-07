#Configuring terraform to be able to create resources in IBM Cloud.
#https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs
terraform {
  required_version = ">= 0.13"
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "~> 1.13.0"
    }
  }
}

# Configure the IBMCloud Provider
provider "ibm" {
  ibmcloud_api_key = ""
  region = var.location
  resource_group   = "lab-rg"
}