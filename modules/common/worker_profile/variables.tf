variable "org_name" {
    type = string
    description = "Intersight Organization name"
}
variable "instance_type_name" {
    type = string
    description = "Virtual Machine Instance Type Name"
}
variable "instance_type_CPU" {
    type = number
    description = "CPU Count for Worker Instance"
}
variable "instance_type_disk" {
    type = string
    description = "Instance Disk Size "
}
variable "instance_type_memory" {
    type = number
    description = "Instance Memory Size"
}
