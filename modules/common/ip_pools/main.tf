data "intersight_organization_organization" "organization" {
    name = var.org_name
}
resource "intersight_ippool_pool" "ip_pool" {
    name = var.ip_pool_name
    ip_v4_blocks {
        from = var.ip_pool_starting_address
        size = var.ip_pool_size
        # to = "10.139.12.200"
    }

    ip_v4_config {
        netmask = var.ip_pool_netmask
        gateway = var.ip_pool_gateway
        primary_dns = var.ip_pool_dns1
        secondary_dns = var.ip_pool_dns2
    }

    organization {
    object_type = "organization.Organization"
    moid = data.intersight_organization_organization.organization.moid
  }

    tags { 
        key = "Managed_By"
        value = "Terraform"
    } 
}