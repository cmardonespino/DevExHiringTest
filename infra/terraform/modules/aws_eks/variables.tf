variable "eks_cluster_name" {
  type        = string
  description = ""
}

variable "eks_cluster_version" {
  type        = string
  description = ""
  default     = "1.31"
}

variable "eks_cluster_subnet_ids" {
  type        = list(string)
  description = ""
}

variable "node_ssm_connection" {
  type        = bool
  description = ""
  default     = false
}

variable "eks_nodegroup_name" {
  type        = string
  description = ""
}

variable "vpc_id" {
  type        = string
  description = ""
}

variable "eks_nodegroup_subnet_ids" {
  type        = list(string)
  description = ""
}

variable "instance_config_ebs_volume_size" {
  type        = number
  description = ""
  default     = 20
}

variable "instance_config_ebs_iops" {
  type        = number
  description = ""
  default     = 0
}

variable "instance_config_ebs_volume_type" {
  type        = string
  description = ""
  default     = "gp3"
}

variable "instance_config_ebs_delete_on_termination" {
  type        = bool
  description = ""
  default     = true
}

variable "instance_config_type" {
  type        = string
  description = ""
  default     = "t3.micro"
}

variable "eks_nodegroup_ssm_connection" {
  type        = bool
  description = ""
  default     = false
}

variable "launch_template_version" {
  type        = string
  description = ""
  default     = "1.31"
}

variable "scaling_config_desired_size" {
  type        = number
  description = ""
  default     = 1
}

variable "scaling_config_max_size" {
  type        = number
  description = ""
  default     = 2
}

variable "scaling_config_min_size" {
  type        = number
  description = ""
  default     = 1
}

variable "capacity_type" {
  type        = string
  description = ""
  default     = "ON_DEMAND"
}

variable "ami_type" {
  type        = string
  description = ""
  default     = "AL2_x86_64"
}

variable "eks_nodegroup_version" {
  type        = string
  description = ""
  default     = null
}

variable "eks_nodegroup_labels" {
  type        = map(any)
  description = ""
  default     = {}
}
