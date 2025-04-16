## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.60.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.2.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.60.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.3 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Usage

```
module "eks_devexhiringtest_cluster" {
  source                 = "./modules/aws_eks"
  vpc_id                 = data.aws_vpc.devexhiringtest.id
  eks_cluster_name       = "devexhiringtest-cmardonesp"
  eks_cluster_subnet_ids = data.aws_subnets.private.ids

  eks_nodegroup_name       = "ng-devexhiringtest"
  eks_nodegroup_subnet_ids = data.aws_subnets.private.ids
  node_ssm_connection      = true

  aws_profile = "devops"
}
```

## Resources

| Name | Type |
|------|------|
| [aws_eks_addon.cni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.code_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.kube_proxy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.nodegroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_instance_profile.profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.nodegroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.vpc_cni_addon](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.amazon_eks_cluster_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.amazon_eks_vpc_resource_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_cni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_key_pair.kp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_launch_template.template](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_security_group.control_plane](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.nodegroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.shared_nodes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.ingress_control_plane](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_four](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_node](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_one](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_shared_nodes_one](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_shared_nodes_two](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_three](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_two](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [null_resource.thumbprint](https://registry.terraform.io/providers/hashicorp/null/3.2.3/docs/resources/resource) | resource |
| [tls_private_key.pk](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.nodegroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_subnet.cluster_selected_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.ng_selected_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [template_file.user_data](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_type"></a> [ami\_type](#input\_ami\_type) | Specifies the AMI (Amazon Machine Image) type for launching EC2 instances or nodes in a group. It defines the operating system and configuration of the instance | `string` | `"AL2_x86_64"` | no |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | Profile name used for execute eksctl resources | `string` | n/a | yes |
| <a name="input_capacity_type"></a> [capacity\_type](#input\_capacity\_type) | Specifies the capacity type for the instance or node group. This determines how the instance or node is managed in terms of scaling and billing | `string` | `"ON_DEMAND"` | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | EKS Cluster name | `string` | n/a | yes |
| <a name="input_eks_cluster_subnet_ids"></a> [eks\_cluster\_subnet\_ids](#input\_eks\_cluster\_subnet\_ids) | EKS Cluster subnet ids | `list(string)` | n/a | yes |
| <a name="input_eks_cluster_version"></a> [eks\_cluster\_version](#input\_eks\_cluster\_version) | EKS Cluster version | `string` | `"1.31"` | no |
| <a name="input_eks_nodegroup_labels"></a> [eks\_nodegroup\_labels](#input\_eks\_nodegroup\_labels) | A variable that contains a set of labels (key-value pairs) that you want to apply to the node group | `map(any)` | `{}` | no |
| <a name="input_eks_nodegroup_name"></a> [eks\_nodegroup\_name](#input\_eks\_nodegroup\_name) | EKS Cluster nodegroup name | `string` | n/a | yes |
| <a name="input_eks_nodegroup_subnet_ids"></a> [eks\_nodegroup\_subnet\_ids](#input\_eks\_nodegroup\_subnet\_ids) | EKS nodegroup subnet ids | `list(string)` | n/a | yes |
| <a name="input_eks_nodegroup_version"></a> [eks\_nodegroup\_version](#input\_eks\_nodegroup\_version) | EKS nodegroup version. If it is null, the nodegroup will have the EKS Cluster version | `string` | `null` | no |
| <a name="input_instance_config_ebs_delete_on_termination"></a> [instance\_config\_ebs\_delete\_on\_termination](#input\_instance\_config\_ebs\_delete\_on\_termination) | Whether to automatically delete the volume when the instance is terminated. Boolean: true or false | `bool` | `true` | no |
| <a name="input_instance_config_ebs_iops"></a> [instance\_config\_ebs\_iops](#input\_instance\_config\_ebs\_iops) | Number of I/O operations per second. Only applicable for io1 and io2 volume types. Ignored for gp3 unless explicitly set | `number` | `0` | no |
| <a name="input_instance_config_ebs_volume_size"></a> [instance\_config\_ebs\_volume\_size](#input\_instance\_config\_ebs\_volume\_size) | Size of the EBS volume in GB. Example: 20, 100, etc | `number` | `20` | no |
| <a name="input_instance_config_ebs_volume_type"></a> [instance\_config\_ebs\_volume\_type](#input\_instance\_config\_ebs\_volume\_type) | Type of EBS volume: gp2, gp3, io1, io2, sc1, st1, etc | `string` | `"gp3"` | no |
| <a name="input_instance_config_type"></a> [instance\_config\_type](#input\_instance\_config\_type) | Specifies the EC2 instance type, such as t3.micro, m5.large, c6i.xlarge, etc. This determines the compute power (vCPUs, RAM, network performance) of the EC2 instance | `string` | `"t3.medium"` | no |
| <a name="input_node_ssm_connection"></a> [node\_ssm\_connection](#input\_node\_ssm\_connection) | Put in true if you want to connect with SSM to the nodes | `bool` | `false` | no |
| <a name="input_scaling_config_desired_size"></a> [scaling\_config\_desired\_size](#input\_scaling\_config\_desired\_size) | The desired number of instances (or nodes) that should be running by default. This is the starting or target size of the group | `number` | `1` | no |
| <a name="input_scaling_config_max_size"></a> [scaling\_config\_max\_size](#input\_scaling\_config\_max\_size) | The maximum number of instances the group can scale up to. This sets the upper limit for auto-scaling | `number` | `2` | no |
| <a name="input_scaling_config_min_size"></a> [scaling\_config\_min\_size](#input\_scaling\_config\_min\_size) | The minimum number of instances the group should maintain. The group won't scale down below this number | `number` | `1` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID where the EKS Cluster will be created | `string` | n/a | yes |

## Outputs

No outputs.
