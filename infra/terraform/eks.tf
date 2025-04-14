module "eks_devexhiringtest_cluster" {
  source                 = "./modules/aws_eks"
  vpc_id                 = data.aws_vpc.devexhiringtest.id
  eks_cluster_name       = "devexhiringtest-cmardonesp"
  eks_cluster_subnet_ids = data.aws_subnets.private.ids

  eks_nodegroup_name       = "ng-devexhiringtest"
  eks_nodegroup_subnet_ids = data.aws_subnets.private.ids
  node_ssm_connection = true

  aws_profile = "devops"
}