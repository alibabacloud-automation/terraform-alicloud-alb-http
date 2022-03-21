output "this_alb_instance_id" {
  description = "The instance ID of ALB."
  value = alicloud_alb_load_balancer.default.id
}

output "this_alb_server_group_id" {
  description = "The ID of ALB server group."
  value = alicloud_alb_server_group.default.id
}

output "this_alb_listener" {
  description = "The ID of ALB http listener."
  value = alicloud_alb_listener.example.id
}