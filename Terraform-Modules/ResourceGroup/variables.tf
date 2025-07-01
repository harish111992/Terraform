variable "ResourceGroup" {
    description = "Name of the Resource Group"
    type = string
  
}
variable "RGLocation" {
    description = "Location of the RG"
    type = string
  
}
variable "Mandatory_TAGS" {
    description = "value"
    type = map(string)
    default = {
      DeploymentDate = ""
    }
}