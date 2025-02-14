# Network Security Group for Public VMs to allow SSH and private connectivity
resource "azurerm_network_security_group" "public_vm_nsg_1" {
  name                = "TEAMC-PublicVMNSG1"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowPrivateConnectivity"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.1.1.0/24"
    destination_address_prefix = "10.0.1.0/24"
  }
}

resource "azurerm_network_security_group" "public_vm_nsg_2" {
  name                = "TEAMC-PublicVMNSG2"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowPrivateConnectivity"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.1.2.0/24"
    destination_address_prefix = "10.0.2.0/24"
  }
}

resource "azurerm_network_security_group" "public_vm_nsg_3" {
  name                = "TEAMC-PublicVMNSG3"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowPrivateConnectivity"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.1.3.0/24"
    destination_address_prefix = "10.0.3.0/24"
  }
}

# Network Security Group for Private VMs to allow private connectivity
resource "azurerm_network_security_group" "private_vm_nsg_1" {
  name                = "TEAMC-PrivateVMNSG1"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "AllowPrivateConnectivity"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "10.1.1.0/24"
  }
}

resource "azurerm_network_security_group" "private_vm_nsg_2" {
  name                = "TEAMC-PrivateVMNSG2"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "AllowPrivateConnectivity"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.0.2.0/24"
    destination_address_prefix = "10.1.2.0/24"
  }
}

resource "azurerm_network_security_group" "private_vm_nsg_3" {
  name                = "TEAMC-PrivateVMNSG3"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "AllowPrivateConnectivity"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.0.3.0/24"
    destination_address_prefix = "10.1.3.0/24"
  }
}

# Associate NSGs with Network Interfaces
resource "azurerm_network_interface_security_group_association" "public_vm_nic_nsg_1" {
  network_interface_id      = azurerm_network_interface.public_vm_nic_1.id
  network_security_group_id = azurerm_network_security_group.public_vm_nsg_1.id
}

resource "azurerm_network_interface_security_group_association" "public_vm_nic_nsg_2" {
  network_interface_id      = azurerm_network_interface.public_vm_nic_2.id
  network_security_group_id = azurerm_network_security_group.public_vm_nsg_2.id
}

resource "azurerm_network_interface_security_group_association" "public_vm_nic_nsg_3" {
  network_interface_id      = azurerm_network_interface.public_vm_nic_3.id
  network_security_group_id = azurerm_network_security_group.public_vm_nsg_3.id
}

resource "azurerm_network_interface_security_group_association" "private_vm_nic_nsg_1" {
  network_interface_id      = azurerm_network_interface.private_vm_nic_1.id
  network_security_group_id = azurerm_network_security_group.private_vm_nsg_1.id
}

resource "azurerm_network_interface_security_group_association" "private_vm_nic_nsg_2" {
  network_interface_id      = azurerm_network_interface.private_vm_nic_2.id
  network_security_group_id = azurerm_network_security_group.private_vm_nsg_2.id
}

resource "azurerm_network_interface_security_group_association" "private_vm_nic_nsg_3" {
  network_interface_id      = azurerm_network_interface.private_vm_nic_3.id
  network_security_group_id = azurerm_network_security_group.private_vm_nsg_3.id
}