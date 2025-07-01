resource "azurerm_resource_group" "ResourceGroup" {
  name     = "${var.ResourceGroup}"
  location = "${var.Location}"
}

resource "azurerm_virtual_network" "Vnet1" {
  name                = "${var.vnet_name}"
  address_space       = ["${var.Vnet_address}"]
  location            = azurerm_resource_group.ResourceGroup.location
  resource_group_name = azurerm_resource_group.ResourceGroup.name
}

resource "azurerm_subnet" "Subnet1" {
  name                 = "${var.snet_name}"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.Vnet1.name
  address_prefixes     = ["${var.subnet_address}"]
}

resource "azurerm_network_interface" "NIC" {
  name                = "${var.NIC}-nic01"
  location            = azurerm_resource_group.ResourceGroup.location
  resource_group_name = azurerm_resource_group.ResourceGroup.name

  ip_configuration {
    name                          = "${var}-ip01"
    subnet_id                     = azurerm_subnet.Subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}