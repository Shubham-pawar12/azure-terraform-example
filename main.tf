terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.27.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "70396b64-2fce-496a-b285-9482f935fe9c"
}

resource "azurerm_resource_group" "example" {
  name     = "shubh-terraform-rg"
  location = "Central India"
}

resource "azurerm_storage_account" "example" {
  name                     = "shubhterraformstorage123"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}