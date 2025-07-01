//Define a variable for Resouce Group 
variable "ResourceGroup" {
    description = "Resource Group Name"
    type = string      
}
// location of the RG
variable "Location" {
    description = "RG Location"
    default = "West Europe"
    type = string
}

// virtual Network Name
variable "vnet_name" {
    description = "Vnet name"
    type = string
  
}

// Vnet Address Range
variable "Vnet_address" {
    description = "Vnet Address"
    type = number
  
}

variable "snet_name" {
    description = "snet name"
    type = string
  
}
//subnet Range
variable "subnet_address" {
    description = "Subnet Address"
    type = number
}

//NIC Name
variable "NIC" {
    type = string
  
}
