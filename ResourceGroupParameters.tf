locals {
  rgnames = ["Test-RG", "Test-RG1"]
}

module "RG" {
    source = "./Terraform-Modules/ResourceGroup"
    count = length(local.rgnames)
    providers = {
      azurerm = azurerm.Sandbox
    }
    RGLocation = "East US 2"
    ResourceGroup = local.rgnames[count.index]
    Mandatory_TAGS = {
          costCentre = "CC0143"
          PatchingPolicy = "SandobxPatchingPolicy"
          DeploymentDate = ""
          DesignReference = "TBD"
    }
}

output "ResourceGroupNames" {
  value = [for i in module.RG : i.name]
}