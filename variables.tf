variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "Ambiente de execução (local ou cloud)"
  type        = string
  default     = "local"
}
