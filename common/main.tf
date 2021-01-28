provider "intersight" {
  apikey = var.api_key
  secretkeyfile = var.secret_key
  endpoint = var.endpoint
}

module "worker_instance_type" {
    
  source = "../modules/common/worker_profile"
  for_each  = {for instance in var.instance_type: instance.name => instance}
  org_name = var.organization
  instance_type_name = each.value.name
  instance_type_CPU = each.value.cpu
  instance_type_disk = each.value.disk
  instance_type_memory  = each.value.memory
}
module "network_policies" {

  source = "../modules/common/network"
  org_name = var.organization
  # Kubernetes Network Policy
  k8s_network_policy_name = "k8sNetworkSvcPolicy"
  network_service_cidr = var.network_service_cidr_block
  network_pod_cidr = var.network_pod_cidr_block
  tz = var.local_tz
  name_servers = var.local_dns
  time_servers = var.local_ntp
  domain_name = var.local_dns_name

}
module "network_ip_pool" {
  source = "../modules/common/ip_pools"
  
  for_each  = {for pool in var.ip_pool: pool.name => pool}
  org_name = var.organization
  ip_pool_name = each.value.name
  ip_pool_starting_address = each.value.starting_address
  ip_pool_size = each.value.size
  ip_pool_netmask = each.value.netmask
  ip_pool_gateway = each.value.gateway
  ip_pool_dns1 = var.local_dns[0]
  ip_pool_dns2 = var.local_dns[1]
}
module "iks_version" {
  source = "../modules/common/cluster"
  
  for_each = {for version in var.k8s_version: version.name => version}
  org_name = var.organization
  k8s_version = each.value.version
  k8s_version_policy_name = each.value.name
}
module "iks_addons" {
  source = "../modules/common/addons"
  org_name = var.organization
  addon_list = var.addon_list
  addon_policy_name = var.addon_policy_name
}
