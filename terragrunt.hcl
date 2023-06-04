terraform {
  # https://runterrascan.io/ # style linting  for TF files
  before_hook "terraform fmt" {
    commands = ["apply", "init", "plan"]
    execute  = ["terraform", "fmt", "-recursive", "."]
  }

  # https://terragrunt.gruntwork.io/docs/reference/cli-options/#hclfmt # style linting for HCL files
  before_hook "terragrunt fmt" {
    commands = ["apply", "init", "plan"]
    execute  = ["terragrunt", "hclfmt", "."]
  }

  extra_arguments "init" {
    // Use a flag '-upgrade' para atualizar os plugins Terraform
    commands = ["init", "-upgrade"]
  }
}
