variable "org_name" {
    type = string
    description = "Intersight Organization name"
}

variable "infra_list" {
    # sensitive = true
    type = list(object({
            name = string
            instance_type = string
            infra_provider_fqdn = string
            cluster = string
            interfaces = list(string)
            datastore = string
            passphrase = string
            resource_pool = string

    }))
}