output "subnet_id" {
  description = "List of Subnet ID"
  value       = azurerm_subnet.subnet[*].id
}