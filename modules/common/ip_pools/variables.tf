variable "org_name" {
    type = string
    description = "Intersight Organization name"
}
variable "ip_pool_name" {
    type = string
    description = "IP Pool Name"
}
variable "ip_pool_starting_address" {
    type = string
    description = "IP Pool Subnet"
}
variable "ip_pool_size" {
    type = string
    description = "Size of the IP Pool"
}
variable "ip_pool_netmask" {
    type = string
    description = "IP Pool Netmask"
}
variable "ip_pool_gateway" {
    type = string
    description = "IP Pool Gateway"
}
variable "ip_pool_dns1" {
    type = string
    description = "Primary DNS Server"
}
variable "ip_pool_dns2" {
    type = string
    description = "Secondary DNS Server"
}

