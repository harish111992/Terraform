locals {
  rgnames = {
    Test-RG = "East US 2"
    Test-RG2 = "Easr US"
  }
}

module "RG" {
    source = "./Terraform-Modules/ResourceGroup"
    for_each = local.rgnames
    providers = {
      azurerm = azurerm.Sandbox
    }
    RGLocation = each.value
    ResourceGroup = each.key
    Mandatory_TAGS = {
          costCentre = "CC0143"
          PatchingPolicy = "SandobxPatchingPolicy"
          DeploymentDate = ""
          DesignReference = "TBD"
    }
}

output "ResourceGroupNames" {
  value = [for i in module.RG : i.RG_name]
}

output "ResourceGroupLocations" {
  value = [for Location in module.RG : Location.RG_Location]
}
