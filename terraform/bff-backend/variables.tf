variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "eks_role_arn" {
  description = "The ARN of the EKS service role"
  type        = string
}

variable "node_role_arn" {
  description = "The ARN of the node instance role"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the EKS cluster"
  type        = list(string)
}
