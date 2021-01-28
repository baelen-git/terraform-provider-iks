variable "org_name" {
    type = string
    description = "Intersight Organization name"
}
variable "addon_list" {
  type = list(object({
    name = string,
    upgrade_strategy = string,
    policy_name = string
  }))
}
variable "addon_policy_name" {
    type = string
    description = "Addon Name for Creation"
}

