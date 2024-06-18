resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = var.eks_role_arn
  
  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "primary"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids
  
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}
