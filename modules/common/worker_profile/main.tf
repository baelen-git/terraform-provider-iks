data "intersight_organization_organization" "organization" {
    name = var.org_name
}
resource "intersight_kubernetes_virtual_machine_instance_type" "instance" {

    name = var.instance_type_name
    cpu = var.instance_type_CPU
    disk_size = var.instance_type_disk
    memory = var.instance_type_memory   
    organization {
    object_type = "organization.Organization"
    moid = data.intersight_organization_organization.organization.moid
  }
    tags { 
        key = "Managed_By"
        value = "Terraform"
    } 
}

