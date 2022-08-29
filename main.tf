
# main.tf
## região que você criará os recursos

variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

## provider que você utilizará, nesse exemplo vou estar utilizando apenas AWS

provider "aws" {
  region = var.region
}

## em qual AZ vc quer criar esse recurso, no caso estou selecionando qualquer uma disponível

data "aws_availability_zones" "available" {}

## qual será o nome do seu cluster, estou usando um sufixo apenas para evitar falhas e não tenho muita criatividade

locals {
  cluster_name = "My-EKS-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}
