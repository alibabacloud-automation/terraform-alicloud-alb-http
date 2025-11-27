terraform-alicloud-alb-http
=====================================================================

本 Module 用于在阿里云创建一个[应用型负载均衡(ALB)](https://help.aliyun.com/document_detail/250240.html), 并为其绑定Http监听.

本 Module 支持创建以下资源:

* [应用型负载均衡(Alb_Load_Balancer)](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/alb_load_balancer)
* [应用型负载均衡服务器分组(Alb_Server_Group)](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/alb_server_group)
* [应用型负载均衡访问控制权限(Alb_Acl)](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/alb_acl)
* [应用型负载均衡监听(Alb_Listener)](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/alb_listener)

## 版本要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.131.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.131.0 |

## 用法

<div style="display: block;margin-bottom: 40px;"><div class="oics-button" style="float: right;position: absolute;margin-bottom: 10px;">
  <a href="https://api.aliyun.com/terraform?source=Module&activeTab=document&sourcePath=terraform-alicloud-modules%3A%3Aalb-http&spm=docs.m.terraform-alicloud-modules.alb-http" target="_blank">
    <img alt="Open in AliCloud" src="https://img.alicdn.com/imgextra/i1/O1CN01hjjqXv1uYUlY56FyX_!!6000000006049-55-tps-254-36.svg" style="max-height: 44px; max-width: 100%;">
  </a>
</div></div>


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

提交问题
------
如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)