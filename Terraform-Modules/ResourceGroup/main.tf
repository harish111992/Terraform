resource "azurerm_resource_group" "ResourceGroup" {
  name     = var.ResourceGroup
  location = var.RGLocation
  tags     = local.mandatory_tags
}

locals {
  deployment_date = var.Mandatory_TAGS["DeploymentDate"] != "" ? var.Mandatory_TAGS["DeploymentDate"] : timestamp()

  mandatory_tags = merge(
    var.Mandatory_TAGS,
    {
      DeploymentDate = local.deployment_date
    }
  )
}
