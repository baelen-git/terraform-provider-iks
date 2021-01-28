#Importing the Organization MOID
data "intersight_organization_organization" "organization" {
    name = var.org_name
}
#Importing the Kubernetes Version available
data "intersight_kubernetes_version" "version" {
    kubernetes_version = var.k8s_version
}

resource "intersight_kubernetes_version_policy" "iks_version" {
    name = var.k8s_version_policy_name
    nr_version {
        object_type =  "kubernetes.Version"
        moid = data.intersight_kubernetes_version.version.id
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
