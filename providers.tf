terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  alias           = "Sandbox"
  client_id = var.client_id
  client_secret = "**************"
  subscription_id = var.sbx_subscription_id
  tenant_id = var.tenant_id
  features {}
}


provider "azurerm" {
  alias           = "Dev"
  client_id = var.client_id
  client_secret = "**************"
  subscription_id = var.dev_subscription_id
  tenant_id = var.tenant_id
  features {}
}
