variable "vpc_name" {
  default     = "tf_vpc_name"
  type        = string
  description = "The name of VPC."
}

variable "vpc_cidr_block" {
  default     = "11.0.0.0/16"
  type        = string
  description = "The CIDR block of VPC."
}

variable "vswitch_name_1" {
  default     = "tf_vswitch_name_1"
  type        = string
  description = "The name of one v_switch."
}

variable "vswitch_name_2" {
  default     = "tf_vswitch_name_2"
  type        = string
  description = "The name of the other v_switch."
}

variable "create" {
  description = "Whether to create resources in module."
  type        = bool
  default     = false
}

variable "log_project_name" {
  default = "tflogprojectname"
  type = string
  description = "The name of log project."
}

variable "log_store_name" {
  default = "tflogstorename"
  type = string
  description = "The name of log store."
}
