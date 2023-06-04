terraform {
  source = "."

  # https://github.com/infracost/infracost # cost control and reporting
  after_hook "infracost" {
    commands = ["apply", "plan"]
    execute  = ["infracost", "diff", "--compare-to", "infracost-base.json", "--path", "${get_repo_root()}/Azure", "--project-name", "seekers-tf-azure", "--show-skipped"]
  }

  # https://github.com/terraform-docs/terraform-docs # documentation generator
  after_hook "terraform-docs" {
    commands = ["apply", "plan"]
    execute  = ["terraform-docs", "markdown", "table", "--output-file", "${get_repo_root()}/Azure/Azure.md", "--output-mode", "inject", "."]
  }

  extra_arguments "custom_vars" {

    arguments = [
      "-var-file=${get_repo_root()}/Azure/azure.tfvars"
    ]

    commands = [
      "apply",
      "import",
      "plan",
      "push",
      "refresh",
    ]
  }

}

include {
  path = find_in_parent_folders()
}