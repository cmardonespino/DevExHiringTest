resource "aws_launch_template" "template" {

  name = "eks-${var.eks_cluster_name}-${var.eks_nodegroup_name}"

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = var.instance_config_ebs_volume_size
      iops                  = var.instance_config_ebs_iops
      volume_type           = var.instance_config_ebs_volume_type
      delete_on_termination = var.instance_config_ebs_delete_on_termination
    }
  }

  disable_api_stop        = false
  disable_api_termination = false

  instance_type = var.instance_config_type

  network_interfaces {
    security_groups = [
      aws_security_group.eks.id,
      aws_security_group.nodegroup.id
    ]
  }

  user_data = base64encode(data.template_file.user_data.rendered)

  tags = {
    Name = "eks-${var.eks_cluster_name}-${var.eks_nodegroup_name}"
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      "Name"        = "${var.eks_nodegroup_name}-node",
      "ClusterName" = var.eks_cluster_name
    }
  }

  tag_specifications {
    resource_type = "volume"
    tags = {
      "Name"        = "${var.eks_nodegroup_name}-volumeNode",
      "ClusterName" = var.eks_cluster_name
    }
  }
}

data "template_file" "user_data" {

  template = file("${path.module}/user_data.sh")

  vars = {
    CLUSTER_NAME   = var.eks_cluster_name
    API_SERVER_URL = aws_eks_cluster.cluster.endpoint
    B64_CLUSTER_CA = aws_eks_cluster.cluster.certificate_authority[0].data
  }
}