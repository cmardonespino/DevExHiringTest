/*output "nodegroup_autoscaling_groups" {
  value = for ng in aws_eks_node_group.iterate_nodegroup : ng.node_group_name => {
      asg_name = ng.resources[0].autoscaling_groups[0].name
    }
}

output "nodegroup_security_group_ids" {
  description = "Security Group IDs for the nodegroups"
  value = {
    for nodegroup_key, nodegroup in aws_security_group.nodegroup : nodegroup_key => nodegroup.id
  }
}*/