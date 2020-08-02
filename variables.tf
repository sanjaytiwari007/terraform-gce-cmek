variable "project_id" {
  type=string
  #You can keep default or if you want ot change the project name you can mention that in terrafrom.tfvars
  default = ""
  description = "Pelase mention your proejct ID"
}
variable "zone" {
  type = string
  default = "us-east1-b"
  description = "Please mention zone default zone is us-east1-b"
}
variable "region" {
  type = string
  default = "us-east1"
  description = "Please mention region for your resource default is us-east1"
}
variable "machine_type" {
  type = string
  default = "n1-standard-1"
  description = "Mention machine type default is n1-standard-1"
}
variable "gce_name" {
  type = string
  description = "Name of resource"
}
variable "image" {
  type = string
  default = "debian-cloud/debian-9"
  description = "Compute instance image"
}
variable "project_network" {
  type = string
  default = "default"
  description = "Network we will using for compute instance creation"
}
variable "ring_name" {
  type = string
  description = "KMS key ring name"
}
variable "ring_location" {
  type = string
  description = "Key ring location "
}