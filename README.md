Count: 
  1. In the resourceGroupParametrs you can check how to define the count usage.
  2. The count can be used in 'resource' block 'module' block and some special cases 'datablock'

For loop: 
Especially this can be used in output code block.
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
          costCentre = "CC0123"
          PatchingPolicy = "SandobxPatchingPolicy"
          DeploymentDate = ""
          DesignReference = "TBD"
    }
}

output "ResourceGroupNames" {
  value = [for i in module.RG : i.RG_name]
}

output "ResourceGroupNames" {
  value = module.RG.RG_name
}


<img width="863" alt="count Example_for In output" src="https://github.com/user-attachments/assets/3fd752d4-345f-44f7-887a-64bf22c4ed57" />


