#test
provider "azurerm" {
    features {}

}

#Create a resoursecgroup
resource "azurerm_resource_group" "resource_group" {
    name = "rg-terraform-demo-911"
    location = "eastus"
  
}
