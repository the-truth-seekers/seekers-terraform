terraform {
  source = "."

  # https://github.com/infracost/infracost # cost control and reporting
  after_hook "infracost" {
    commands = ["apply", "plan"]
    execute  = ["infracost", "diff", "--compare-to", "infracost-base.json", "--path", "${get_repo_root()}/AWS", "--project-name", "seekers-tf-aws", "--show-skipped"]
  }

  # https://github.com/terraform-docs/terraform-docs # documentation generator
  after_hook "terraform-docs" {
    commands = ["apply", "plan"]
    execute  = ["terraform-docs", "markdown", "table", "--output-file", "${get_repo_root()}/AWS/AWS.md", "--output-mode", "inject", "."]
  }
}

include {
  path = find_in_parent_folders()
}