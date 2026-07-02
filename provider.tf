terraform {
  backend "http" {
    address        = "https://app.harness.io/gateway/iacm/api/orgs/playground/projects/shrihari_iacm_learning/workspaces/cloudformation_usecase_workspace/terraform-backend?accountIdentifier=gLXLxjTmQhGmdJXhAORKag"
    username       = "harness"
    lock_address   = "https://app.harness.io/gateway/iacm/api/orgs/playground/projects/shrihari_iacm_learning/workspaces/cloudformation_usecase_workspace/terraform-backend/lock?accountIdentifier=gLXLxjTmQhGmdJXhAORKag"
    lock_method    = "POST"
    unlock_address = "https://app.harness.io/gateway/iacm/api/orgs/playground/projects/shrihari_iacm_learning/workspaces/cloudformation_usecase_workspace/terraform-backend/lock?accountIdentifier=gLXLxjTmQhGmdJXhAORKag"
    unlock_method  = "DELETE"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
