variable "cidr-block" {
  default = "10.0.0.0/16"
}

variable "tags" {
  type = map(string)
  default = {
    "Owned"        = "Ashish_Sadanand"
    "Developed_By" = "Terraform"
  }
}