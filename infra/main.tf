#test
provider "azurerm" {
    features {}

}

#Create a resoursecgroup
resource "azurerm_resource_group" "resource_group" {
    name = "rg-terraform-demo-911"
    location = "eastus"
  
}


#Create a Storage Account
resource "azurerm_storage_account" "storage_account" {
    name = "tfstorageaccount911"
    resource_group_name = azurerm_resource_group.resource_group.name
    location = azurerm_resource_group.resource_group.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    account_kind = "StorageV2"

    static_website {
      index_document = "index.html"
    }
}
#Add a file index.html

resource "azurerm_storage_blob" "blob" {
    name = "index.html"
    storage_account_name = azurerm_storage_account.storage_account.name
    storage_container_name = "$web"
    type = "Block"
    content_type = "text/html"
    source_content = "<h1>Deployed Terraform</h1>"
}