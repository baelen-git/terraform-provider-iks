data "intersight_organization_organization" "organization" {
    name = var.org_name
}

resource "intersight_kubernetes_network_policy" "k8s_network_pod_policy" {
    name = "k8sNetworkPodPolicy"
    pod_network_cidr = var.network_pod_cidr
    service_cidr = var.network_service_cidr
    
    organization {
    object_type = "organization.Organization"
    moid = data.intersight_organization_organization.organization.moid
  }

    tags { 
        key = "Managed_By"
        value = "Terraform"
    } 
}

resource "intersight_kubernetes_sys_config_policy" "k8s_network_policy"{
    name = var.k8s_network_policy_name
    dns_servers = var.name_servers
    ntp_servers = var.time_servers
    timezone = var.tz
    dns_domain_name = "rich.ciscolabs.com"
    
    organization {
    object_type = "organization.Organization"
    moid = data.intersight_organization_organization.organization.moid
  }

    tags { 
        key = "Managed_By"
        value = "Terraform"
    } 
}