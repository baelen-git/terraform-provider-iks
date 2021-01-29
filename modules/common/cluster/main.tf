#Importing the Organization MOID
data "intersight_organization_organization" "organization" {
    name = var.org_name
}
#Importing the Kubernetes Version available
data "intersight_kubernetes_version" "version" {
    for_each = {for version in var.k8s_version_list: version.version => version}   
    kubernetes_version = each.value.version
}
resource "intersight_kubernetes_version_policy" "iks_version" {
    
    for_each = {for version in var.k8s_version_list: version.version => version}
    name = each.value.name
    dynamic "nr_version" {
        for_each = data.intersight_kubernetes_version.version
        content {
            object_type =  "kubernetes.Version"
            moid = data.intersight_kubernetes_version.version[each.value.version].moid
        }
    }
    
    # nr_version {
    #     object_type =  "kubernetes.Version"
    #     moid = data.intersight_kubernetes_version.version.id
    # }

    tags { 
        key = "Managed_By"
        value = "Terraform"
    }
    organization {
        object_type = "organization.Organization"
        moid = data.intersight_organization_organization.organization.moid
    } 
}