# azure_vm.tf
resource "azurerm_public_ip" "web_pip" {
  name                = "${var.resource_prefix}-pip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "Central US"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "web_nic" {
  name                = "${var.resource_prefix}-nic"
  location            = "Central US"
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.public.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.web_pip.id
  }
}

resource "azurerm_linux_virtual_machine" "web_vm" {
  name                            = "${var.resource_prefix}-vm"
  location                        = "Central US"
  resource_group_name             = azurerm_resource_group.rg.name
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.web_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 64
  }

  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = "latest"
  }

  custom_data = filebase64("${path.module}/cloud_init.yml")

  tags = {
    Name = "${var.resource_prefix}-web-vm"
    Env  = "target"
  }
}
