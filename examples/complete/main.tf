module "example" {
  source = "../.."
  vpc_name = "tf_vpc_name"
  vpc_cidr_block = "11.0.0.0/16"
  alb_address_type = "Internet"
  alb_address_allocated_mode = "Fixed"
  alb_load_balancer_name = "tf_alb_name"
  alb_load_balancer_edition = "Basic"
  log_project_name = "tflogprojectname"
  log_store_name = "tflogstorename"
  alb_acl_name = "tf_acl_name"
  acl_server_group_name = "acl_server_group_name"
}