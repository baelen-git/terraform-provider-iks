data "intersight_organization_organization" "organization" {
    name = var.org_name
}
data "intersight_asset_target" "infra_target" {
    for_each = {for provider in var.infra_list: provider.infra_provider_fqdn => provider}   
    name = each.value.infra_provider_fqdn
}
data "intersight_kubernetes_virtual_machine_instance_type" "master_instance" {
    for_each = {for instance in var.infra_list: instance.instance_type => instance}   
    name = each.value.instance_type
}
resource "intersight_kubernetes_virtual_machine_infrastructure_provider" "infra_provider" {
    for_each = {for name in var.infra_list: name.name => name}
    name = each.value.name
    dynamic "infra_config" {
        for_each = var.infra_list
        content {
            object_type =  "kubernetes.EsxiVirtualMachineInfraConfig"
            interfaces = infra_config.value["interfaces"]
            additional_properties = jsonencode({
                Datastore = infra_config.value["datastore"]
                Cluster = infra_config.value["cluster"]
                Passphrase = infra_config.value["passphrase"]
                ResourcePool = infra_config.value["resource_pool"]
            })
        }
    }
    instance_type {
        object_type = "kubernetes.VirtualMachineInstanceType"
        moid = data.intersight_kubernetes_virtual_machine_instance_type.master_instance[each.value.instance_type].moid
    }
    target {
        object_type = "asset.DeviceRegistration"
        moid = data.intersight_asset_target.infra_target[each.value.infra_provider_fqdn].registered_device[0].moid
    }
 
    tags { 
        key = "Managed_By"
        value = "Terraform"
    }
    organization {
        object_type = "organization.Organization"
        moid = data.intersight_organization_organization.organization.moid
    }
}