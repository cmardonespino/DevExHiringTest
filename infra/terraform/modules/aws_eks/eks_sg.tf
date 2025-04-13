resource "aws_security_group" "control_plane" {
  name        = "eks-${var.eks_cluster_name}-control-plane"
  description = "Communication between the control plane and worker nodegroups"
  vpc_id      = var.vpc_id

  /*ingress {
    cidr_blocks = [for subnet in data.aws_subnet.selected_subnets : subnet.cidr_block]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "Allow traffic from subnets to Control Plane"
  }*/

  egress {
    cidr_blocks = [
      "0.0.0.0/0",
    ]
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
    description      = "Allow all outbound traffic from Control Plane"
  }

  lifecycle {
    ignore_changes = [
      ingress,
    ]
  }

  tags = {
    Name = "eks-${var.eks_cluster_name}-control-plane"
  }
}

resource "aws_security_group_rule" "ingress_control_plane" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodegroup.id
  source_security_group_id = aws_security_group.control_plane.id
  description              = "Allow unmanaged nodes to communicate with control plane (all ports)"
}

resource "aws_security_group_rule" "ingress_node" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.control_plane.id
  source_security_group_id = aws_security_group.nodegroup.id
  description              = "Allow unmanaged nodes to communicate with control plane (all ports)"
}
