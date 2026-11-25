terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

module "nginx" {
  source = "../.."
  # From GitHub: source = "git::ssh://git@github.com/EMA-KPEGEOT/terraform_lab2.git"

  container_count = 3
  name_prefix     = "web"
  starting_port   = 3000
  memory          = 128
}

output "urls" {
  value = module.nginx.urls
}
