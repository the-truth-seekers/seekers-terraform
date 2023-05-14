terraform {
  source = "."

  # https://github.com/terraform-docs/terraform-docs # documentation generator
  after_hook "terraform-docs" {
    commands = ["apply", "plan"]
    execute  = ["terraform-docs", "markdown", "table", "--output-file", "${get_repo_root()}/AWS/AWS.md", "--output-mode", "inject", "."]
  }
}

include {
  path = find_in_parent_folders()
}