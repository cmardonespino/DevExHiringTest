variable "eks_cluster_name" {
  type        = string
  description = "EKS Cluster name"
}

variable "eks_cluster_version" {
  type        = string
  description = "EKS Cluster version"
  default     = "1.31"
}

variable "eks_cluster_subnet_ids" {
  type        = list(string)
  description = "EKS Cluster subnet ids"
}

variable "node_ssm_connection" {
  type        = bool
  description = "Put in true if you want to connect with SSM to the nodes"
  default     = false
}

variable "eks_nodegroup_name" {
  type        = string
  description = "EKS Cluster nodegroup name"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the EKS Cluster will be created"
}

variable "eks_nodegroup_subnet_ids" {
  type        = list(string)
  description = "EKS nodegroup subnet ids"
}

variable "instance_config_ebs_volume_size" {
  type        = number
  description = "Size of the EBS volume in GB. Example: 20, 100, etc"
  default     = 20
}

variable "instance_config_ebs_iops" {
  type        = number
  description = "Number of I/O operations per second. Only applicable for io1 and io2 volume types. Ignored for gp3 unless explicitly set"
  default     = 0
}

variable "instance_config_ebs_volume_type" {
  type        = string
  description = "Type of EBS volume: gp2, gp3, io1, io2, sc1, st1, etc"
  default     = "gp3"
}

variable "instance_config_ebs_delete_on_termination" {
  type        = bool
  description = "Whether to automatically delete the volume when the instance is terminated. Boolean: true or false"
  default     = true
}

variable "instance_config_type" {
  type        = string
  description = "Specifies the EC2 instance type, such as t3.micro, m5.large, c6i.xlarge, etc. This determines the compute power (vCPUs, RAM, network performance) of the EC2 instance"
  default     = "t3.medium"
}

variable "scaling_config_desired_size" {
  type        = number
  description = "The desired number of instances (or nodes) that should be running by default. This is the starting or target size of the group"
  default     = 1
}

variable "scaling_config_max_size" {
  type        = number
  description = "The maximum number of instances the group can scale up to. This sets the upper limit for auto-scaling"
  default     = 2
}

variable "scaling_config_min_size" {
  type        = number
  description = "	The minimum number of instances the group should maintain. The group won't scale down below this number"
  default     = 1
}

variable "capacity_type" {
  type        = string
  description = "Specifies the capacity type for the instance or node group. This determines how the instance or node is managed in terms of scaling and billing"
  default     = "ON_DEMAND"
}

variable "ami_type" {
  type        = string
  description = "Specifies the AMI (Amazon Machine Image) type for launching EC2 instances or nodes in a group. It defines the operating system and configuration of the instance"
  default     = "AL2_x86_64"
}

variable "eks_nodegroup_version" {
  type        = string
  description = "EKS nodegroup version. If it is null, the nodegroup will have the EKS Cluster version"
  default     = null
}

variable "eks_nodegroup_labels" {
  type        = map(any)
  description = "A variable that contains a set of labels (key-value pairs) that you want to apply to the node group"
  default     = {}
}

variable "aws_profile" {
  type        = string
  description = "Profile name used for execute eksctl resources"
}

variable "addon_kube_proxy_version" {
  type = string
  description = "Kube proxy addon version"
  default = "v1.31.3-eksbuild.2"
}

variable "addon_code_dns_version" {
  type = string
  description = "Core DNS addon version"
  default = "v1.11.4-eksbuild.2"
}

variable "addon_cni_version" {
  type = string
  description = "Core DNS addon version"
  default = "v1.19.3-eksbuild.1"
}
