resource "azurerm_resource_group" "storerg" {
    name = "storerg"
    location = "${var.loc}"
    tags     = "${var.tags}"
}

resource "azurerm_storage_account" "teststorage" {
    count = 3
    
    name                     = "terraformteststor[count.index]"
    resource_group_name      = "${azurerm_resource_group.storerg.name}"
    location                 = "${azurerm_resource_group.storerg.location}"
    account_tier             = "Standard"
    account_replication_type = "LRS"
}