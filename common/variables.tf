variable "api_key" {
  type = string
  description = "API Key"
}
variable "secret_key" {
  type = string
  description = "Secret Key file location"
}
variable "endpoint" {
  type = string
  description = "API Endpoint URL"
  default = "https://www.intersight.com"
}
variable "organization" {
  type = string
  description = "Organization Name"
  default = "default"
}
variable "network_pod_cidr_block" {
    type = string
    description = "Pod CIDR Address Block"
    default = "100.65.0.0/16"
}
variable "network_service_cidr_block" {
    type = string
    description = "Service CIDR Block"
    default = "100.64.0.0/24"
}
variable "local_ntp" {
  type = list(string)
  description = "NTP Servers"
}
variable "local_dns" {
  type = list(string)
  description = "DNS Servers"
}
variable "local_tz" {
  type = string
  description = "Timezone"
}
variable "local_dns_name" {
  type = string
  description = "DNS Domain Name"
}
variable "instance_type" {
    type = list(object({
        name = string,
        cpu = number,
        memory = number,
        disk = string
    }))
}
variable "ip_pool" {
    type = list(object({
      name = string,
      starting_address = string,
      size = string,
      netmask = string,
      gateway = string
    }))

}
variable "k8s_version" {
    type = list(object({
        name = string,
        version = string
    }))
}
variable "addons" {
  type = list(object({
    name = string,
    upgrade_strategy = string,
    policy_name = string
  }))
}
# variable "addon_policy_name_" {
#   type = string
#   description = "Addon Policy Name"
# }