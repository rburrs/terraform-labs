resource "azurerm_resource_group" "storerg" {
    name = "storerg"
    location = "${var.loc}"
    tags     = "${var.tags}"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "terraformstate1973"
  resource_group_name      = "${azurerm_resource_group.storerg.name}"
  location                 = "${azurerm_resource_group.storerg.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
    name = "tfstate"
    storage_account_name = "${azurerm_storage_account.tfstate.name}"
    container_access_type = "private"
}

terraform {
  backend "azurerm" {
  storage_account_name = "terraformstate1973"
  container_name       = "tfstate"
  key                  = "c4991cab-5087-4f7e-b84f-0b71c321997f.terraform.tfstate"
  access_key           = "N81T/0g9slVEp9nM6CcB6++tcNkHvGlvNQ4Rf/QYRqaY851ov+0A6HIQbatlMfR30tKYEmGzqjDTFQvoCdXEOA=="
  }
}