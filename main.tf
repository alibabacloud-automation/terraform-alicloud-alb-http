resource "alicloud_alb_load_balancer" "alb" {
  count                  = var.create ? 1 : 0
  vpc_id                 = var.vpc_id
  address_type           = var.address_type
  address_allocated_mode = var.address_allocated_mode
  load_balancer_name     = var.load_balancer_name
  load_balancer_edition  = var.load_balancer_edition
  tags                   = var.tags
  load_balancer_billing_config {
    pay_type = "PayAsYouGo"
  }
  dynamic "zone_mappings" {
    for_each = var.zone_mappings
    content {
      vswitch_id = zone_mappings.value["vswitch_id"]
      zone_id    = zone_mappings.value["zone_id"]
    }
  }
  modification_protection_config {
    status = var.modification_protection_config_status
    reason = var.modification_protection_config_reason
  }

  dynamic "access_log_config" {
    for_each = var.access_log_config
    content {
      log_project = access_log_config.value["log_project"]
      log_store   = access_log_config.value["log_store"]
    }
  }
}

resource "alicloud_alb_server_group" "alb_server_group" {
  count             = var.create ? 1 : 0
  protocol          = "HTTP"
  vpc_id            = var.vpc_id
  server_group_name = var.server_group_name
  resource_group_id = var.resource_group_id

  health_check_config {
    health_check_connect_port = lookup(var.health_check_config, "health_check_connect_port", 80)
    health_check_enabled      = lookup(var.health_check_config, "health_check_enabled", "false")
    health_check_host         = lookup(var.health_check_config, "health_check_host", "")
    health_check_http_version = lookup(var.health_check_config, "health_check_http_version", "HTTP1.1")
    health_check_interval     = lookup(var.health_check_config, "health_check_interval", "2")
    health_check_method       = lookup(var.health_check_config, "health_check_method", "HEAD")
    health_check_path         = lookup(var.health_check_config, "health_check_path", "")
    health_check_protocol     = lookup(var.health_check_config, "health_check_protocol", "")
    health_check_timeout      = lookup(var.health_check_config, "health_check_timeout", "5")
    healthy_threshold         = lookup(var.health_check_config, "healthy_threshold", "3")
    unhealthy_threshold       = lookup(var.health_check_config, "unhealthy_threshold", "3")
  }

  sticky_session_config {
    sticky_session_enabled = lookup(var.sticky_session_config, "sticky_session_enabled", "false")
    cookie                 = lookup(var.sticky_session_config, "cookie", "")
    sticky_session_type    = lookup(var.sticky_session_config, "sticky_session_type", "Server")
  }
  tags = var.tags
}

resource "alicloud_alb_acl" "alb_acl" {
  count             = var.create ? 1 : 0
  acl_name          = var.acl_name
  resource_group_id = var.resource_group_id
}

resource "alicloud_alb_listener" "alb_listener" {
  count                = var.create ? 1 : 0
  load_balancer_id     = alicloud_alb_load_balancer.alb.0.id
  listener_protocol    = "HTTP"
  listener_port        = var.listener_port
  listener_description = var.listener_description
  default_actions {
    type = "ForwardGroup"
    forward_group_config {
      server_group_tuples {
        server_group_id = alicloud_alb_server_group.alb_server_group.0.id
      }
    }
  }
  acl_config {
    acl_type = "White"
    acl_relations {
      acl_id = alicloud_alb_acl.alb_acl.0.id
    }
  }
}