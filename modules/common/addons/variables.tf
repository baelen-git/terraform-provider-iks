variable "org_name" {
    type = string
    description = "Intersight Organization name"
}

variable "addon_definition_name" {
    type = string
    description = "Addon Name for Lookup"
}
variable "addon_name" {
    type = string
    description = "Addon Name for Creation"
}
variable "addon_upgrade_strategy" {
    type = string
    description = "Addon Upgrade Strategy i.e. UpgradeOnly"
}
variable "addon_policy_name" {
    type = string
    description = "Addon Policy Name"
}
