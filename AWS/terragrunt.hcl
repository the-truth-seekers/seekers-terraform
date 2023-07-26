terraform {
  source = "."

  before_hook "terraform fmt" {
    commands = ["apply", "init", "plan"]
    execute  = ["terraform", "fmt", "-recursive", "."]
  }

  # https://terragrunt.gruntwork.io/docs/reference/cli-options/#hclfmt # style linting for HCL files
  before_hook "terragrunt fmt" {
    commands = ["apply", "init", "plan"]
    execute  = ["terragrunt", "hclfmt", "."]
  }

  # https://github.com/infracost/infracost # cost control and reporting
  before_hook "infracost" {
    commands = ["apply", "plan"]
    execute  = ["infracost", "diff", "--compare-to", "infracost-base.json", "--path", "${get_repo_root()}/AWS", "--project-name", "seekers-tf-aws", "--show-skipped"]
  }

  # https://github.com/terraform-docs/terraform-docs # documentation generator
  before_hook "terraform-docs" {
    commands = ["apply", "plan"]
    execute  = ["terraform-docs", "markdown", "table", "--output-file", "${get_repo_root()}/AWS/AWS.md", "--output-mode", "inject", "."]
  }
}

include {
  path = find_in_parent_folders()
}