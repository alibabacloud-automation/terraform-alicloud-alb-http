Terraform module which creates ALB instance and http listener on Alibaba Cloud.

terraform-alicloud-alb-http
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-alb-http/blob/master/README-CN.md)

Terraform module which creates ALB instance and http listener on Alibaba Cloud.

These types of resources are supported:

* [Alb_Load_Balancer](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/alb_load_balancer)
* [Alb_Server_Group](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/alb_server_group)
* [Alb_Acl](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/alb_acl)
* [Alb_Listener](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/alb_listener)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.131.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.131.0 |

## Usage

```hcl
module "example" {
  create                 = true
  source                 = "terraform-alicloud-modules/alb-http/alicloud"
  vpc_id                 = alicloud_vpc.default.id
  address_type           = "Internet"
  address_allocated_mode = "Fixed"
  load_balancer_name     = "tf_alb_name"
  load_balancer_edition  = "Basic"
  zone_mappings          = [
    { vswitch_id = alicloud_vswitch.vswitch_1.id, zone_id = data.alicloud_alb_zones.default.zones.0.id },
    { vswitch_id = alicloud_vswitch.vswitch_2.id, zone_id = data.alicloud_alb_zones.default.zones.1.id }
  ]
  access_log_config = [
    { log_project = alicloud_log_project.default.name, log_store = alicloud_log_store.default.name }
  ]
  acl_name             = "tf_acl_name"
  server_group_name    = "acl_server_group_name"
  listener_port        = 80
  listener_description = "CreatedByTerraform"
}
```

Submit Issues
-------------
If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)