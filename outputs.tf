output "container_names" {
  description = "Names of the generated containers"
  value       = docker_container.this[*].name
}

output "urls" {
  description = "URLs to reach each container"
  value       = [for c in docker_container.this : "http://localhost:${c.ports[0].external}"]
}
