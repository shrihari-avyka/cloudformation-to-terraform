terraform {
  backend "http" {
    address        = "https://app.harness.io/gateway/iacm/api/orgs/playground/projects/shrihari_iacm_learning/workspaces/opentofu_migration_usecase/terraform-backend?accountIdentifier=gLXLxjTmQhGmdJXhAORKag"
    username       = "harness"
    lock_address   = "https://app.harness.io/gateway/iacm/api/orgs/playground/projects/shrihari_iacm_learning/workspaces/opentofu_migration_usecase/terraform-backend/lock?accountIdentifier=gLXLxjTmQhGmdJXhAORKag"
    lock_method    = "POST"
    unlock_address = "https://app.harness.io/gateway/iacm/api/orgs/playground/projects/shrihari_iacm_learning/workspaces/opentofu_migration_usecase/terraform-backend/lock?accountIdentifier=gLXLxjTmQhGmdJXhAORKag"
    unlock_method  = "DELETE"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  encryption {
    # 1. Key Provider: Defines the passphrase (must be at least 16 characters)
    key_provider "pbkdf2" "local_passphrase" {
      passphrase = "a-highly-secure-passphrase-at-least-16-bytes-long"
    }

    # 2. Method: Sets up AES-GCM encryption tied to your passphrase key
    method "aes_gcm" "aes_gcm_method" {
      keys = key_provider.pbkdf2.local_passphrase
    }

    # 3. Migration Fallback: Crucial for reading your current unencrypted state
    method "unencrypted" "migrate_from_plain" {}

    # 4. Target: Enforce the encryption on your state files
    state {
      method = method.aes_gcm.aes_gcm_method

      # CORRECTED: Fallback must be defined as a block
      fallback {
        method = method.unencrypted.migrate_from_plain
      }
    }
  }
}

provider "aws" {
  region = var.aws_region
}
