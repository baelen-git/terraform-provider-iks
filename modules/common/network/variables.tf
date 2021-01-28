variable "org_name" {
    type = string
    description = "Intersight Organization name"
}

variable "network_pod_cidr" {
    type = string
    description = "Pod CIDR Address Block"
}

variable "network_service_cidr" {
    type = string
    description = "Service CIDR Block"
}

variable "name_servers" {
    type = list(string)
    description = "DNS Servers"
}

variable "time_servers" {
    type = list(string)
    description = "Time Servers"
}

variable "tz" {
    type = string
    description = "Time Zone"
}

variable "k8s_network_policy_name" {
    type = string
    description = "Network Policy Name"
}

variable "domain_name" {
    type = string
    description = "DNS Domain Name"
}