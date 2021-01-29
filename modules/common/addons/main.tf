#Importing the Organization MOID
data "intersight_organization_organization" "organization" {
    name = var.org_name
}
data "intersight_kubernetes_addon_definition" "addon_def" {
    for_each  = {for addon in var.addon_list: addon.name => addon}
    name = each.value.name
}
resource "intersight_kubernetes_addon" "addon" {
    for_each = {for addon in var.addon_list: addon.name => addon}
    name = each.value.name
    upgrade_strategy = each.value.upgrade_strategy
    addon_definition {
        moid = data.intersight_kubernetes_addon_definition.addon_def[each.value.name].moid
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
resource "intersight_kubernetes_addon_policy" "addon_policy" {
    name = var.addon_policy_name
    dynamic "addons" {
        for_each = intersight_kubernetes_addon.addon
        content {
            moid = addons.value["id"]
        }
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