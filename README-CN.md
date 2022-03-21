terraform-alicloud-alb
=====================================================================

本 Module 用于在阿里云创建一个ALB负载均衡实例[应用型负载均衡(ALB)](https://help.aliyun.com/document_detail/250240.html), 并为其绑定Http监听.

本 Module 支持创建以下资源:

* [应用型负载均衡(ALB)](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/alb_load_balancer)

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

```hcl
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