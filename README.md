# terraform-docker-nginx

Terraform module spawning N nginx containers (kreuzwerker/docker provider). Each home page shows the container hostname.

```hcl
module "nginx" {
  source = "git::ssh://git@github.com/EMA-KPEGEOT/terraform_lab2.git"

  image           = "nginx:latest"
  memory          = 256
  privileged      = false
  container_count = 3
  name_prefix     = "web"
  starting_port   = 3000
}
```

| Variable | Default | Description |
|---|---|---|
| image | nginx:latest | Image to use |
| memory | 256 | Memory (MB), 0 = unlimited |
| privileged | false | Privileged mode |
| container_count | 1 | Number of containers |
| name_prefix | nginx | Names: `<prefix>-<index>` |
| starting_port | 8000 | Port of the first container, then +1 each |

Outputs: `container_names`, `urls`.
