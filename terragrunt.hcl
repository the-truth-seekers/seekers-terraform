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

  # https://github.com/terraform-linters/tflint # best practice static analysis
  # after_hook "tflint" {
  #   commands = ["apply", "plan"]
  #   execute  = ["tflint", "--color", "."]
  # }

  # https://github.com/infracost/infracost # cost control and reporting
  # after_hook "infracost" {
  #   commands = ["apply", "plan"]
  #   execute  = ["infracost", "diff", "--compare-to", "infracost-base.json", "--path", "${get_repo_root()}/terraform/aws/root", "--project-name", "[[NAMSPACE]]/[[ENV]]"]
  # }

  # https://github.com/terraform-docs/terraform-docs # documentation generator
  after_hook "terraform-docs" {
    commands = ["apply", "plan"]
    execute  = ["terraform-docs", "markdown", "table", "--output-file", "${get_repo_root()}/README.md", "--output-mode", "inject", "."]
  }

  extra_arguments "custom_vars" {

    # arguments = [
    #   "-var-file=terraform.tfvars"
    # ]

    commands = [
      "apply",
      "import",
      "plan",
      "push",
      "refresh",
    ]
  }

  extra_arguments "init" {
    // Use a flag '-upgrade' para atualizar os plugins Terraform
    commands = ["init", "-upgrade"]
  }
}
