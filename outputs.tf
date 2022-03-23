output "this_alb_instance_id" {
  description = "The instance ID of ALB."
  value       = concat(alicloud_alb_load_balancer.alb.*.id, [""])[0]
}

output "this_alb_server_group_id" {
  description = "The ID of ALB server group."
  value       = concat(alicloud_alb_server_group.alb_server_group.*.id, [""])[0]
}

output "this_alb_listener" {
  description = "The ID of ALB http listener."
  value       = concat(alicloud_alb_listener.alb_listener.*.id, [""])[0]
}
