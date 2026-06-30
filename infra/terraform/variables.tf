variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "db_password" {
  description = "RDS master password. Leave empty to generate one automatically."
  type        = string
  default     = null
  sensitive   = true

  validation {
    condition = var.db_password == null || (
      can(regex("^[ -~]+$", var.db_password)) &&
      !can(regex("[/@\" ]", var.db_password))
    )
    error_message = "The RDS master password must use printable ASCII characters except '/', '@', '\"', and spaces."
  }
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "staging"
}
