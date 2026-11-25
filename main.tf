resource "docker_image" "this" {
  name         = var.image
  keep_locally = false
}

resource "docker_container" "this" {
  count      = var.container_count
  name       = "${var.name_prefix}-${count.index}"
  image      = docker_image.this.image_id
  memory     = var.memory
  privileged = var.privileged

  ports {
    internal = 80
    external = var.starting_port + count.index
  }

  # Display the container hostname on the nginx home page
  entrypoint = ["/bin/sh", "-c"]
  command = [
    "echo \"<h1>Hostname : $(hostname)</h1>\" > /usr/share/nginx/html/index.html && exec nginx -g 'daemon off;'"
  ]
}
