# Local Provider Configuration
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      # version = "..."
    }
  }
  # Provider functions require Terraform 1.8 and later.
  required_version = ">= 1.8.0"
}


# Define a variable for the list of file names
variable "file_names" {
  type    = list(string)
  default = ["foo", "bar", "baz"]
}

output "example_output_homedir" {
  value = provider::local::direxists(pathexpand("${path.module}/prueba"))
}

resource "local_file" "foo" {
  count    = 3
  content  = "foo!"
  filename = "./prueba/foo_${count.index}.bar"
  directory_permission = "0777"
  file_permission      = "0777"
}


