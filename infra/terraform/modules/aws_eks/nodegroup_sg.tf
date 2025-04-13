resource "aws_security_group" "nodegroup" {
  name     = "eks-${var.eks_cluster_name}-${var.eks_nodegroup_name}"
  vpc_id   = var.vpc_id

  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = [for subnet in data.aws_subnet.ng_selected_subnets : subnet.cidr_block]
  }

  lifecycle {
    ignore_changes = [
      ingress,
    ]
  }

  tags = {
    Name          = "eks-${var.eks_cluster_name}-${var.eks_nodegroup_name}"
  }

  depends_on = [aws_security_group.control_plane]
}

resource "aws_security_group" "shared_nodes" {
  name        = "eks-${var.eks_cluster_name}-${var.eks_nodegroup_name}-shared-node"
  vpc_id      = var.vpc_id
  description = "Communication between all nodes in the cluster"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name          = "eks-${var.eks_cluster_name}-${var.eks_nodegroup_name}-shared-node"
  }
}

resource "aws_security_group" "eks" {
  name        = "eks-${var.eks_cluster_name}"
  vpc_id      = var.vpc_id
  description = "EKS created security group applied to ENI that is attached to EKS Control Plane master nodes, as well as any managed workloads."

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name          = "eks-${var.eks_cluster_name}"
  }
}

resource "aws_security_group_rule" "ingress_one" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.shared_nodes.id
  source_security_group_id = aws_security_group.eks.id
  description              = "Allow unmanaged nodes to communicate with control plane (all ports)"
}

resource "aws_security_group_rule" "ingress_two" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.eks.id
  source_security_group_id = aws_security_group.eks.id
  description              = "Allow unmanaged nodes to communicate with control plane (all ports)"
}

resource "aws_security_group_rule" "ingress_three" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodegroup.id
  source_security_group_id = aws_security_group.eks.id
  description              = "Allow unmanaged nodes to communicate with control plane (all ports)"
}

resource "aws_security_group_rule" "ingress_four" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.eks.id
  source_security_group_id = aws_security_group.nodegroup.id
  description              = "Allow nodes to communicate with all ports"
}

resource "aws_security_group_rule" "ingress_shared_nodes_one" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.shared_nodes.id
  source_security_group_id = aws_security_group.shared_nodes.id
  description              = "Allow control plane to communicate with nodes (all ports)"
}

resource "aws_security_group_rule" "ingress_shared_nodes_two" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.eks.id
  source_security_group_id = aws_security_group.shared_nodes.id
  description              = "Allow control plane to communicate with nodes (all ports)"
}
