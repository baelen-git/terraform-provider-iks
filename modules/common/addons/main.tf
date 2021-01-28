#Importing the Organization MOID
data "intersight_organization_organization" "organization" {
    name = var.org_name
}

data "intersight_kubernetes_addon_definition" "addon" {
    name = var.addon_definition_name
}

resource "intersight_kubernetes_addon" "addon" {
    
    name = var.addon_name
    upgrade_strategy = var.addon_upgrade_strategy
    addon_definition {
        moid = data.intersight_kubernetes_addon_definition.addon.moid
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

resource "intersight_kubernetes_addon_policy" "addons" {
    name = var.addon_policy_name
    addons {
        moid = intersight_kubernetes_addon.addon.moid
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