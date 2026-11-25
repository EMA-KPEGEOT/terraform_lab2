variable "image" {
  description = "Docker image to use"
  type        = string
  default     = "nginx:latest"
}

variable "memory" {
  description = "Memory limit per container, in MB (0 = unlimited)"
  type        = number
  default     = 256
}

variable "privileged" {
  description = "Run the containers in privileged mode"
  type        = bool
  default     = false
}

variable "container_count" {
  description = "Number of containers to spawn"
  type        = number
  default     = 1
}

variable "name_prefix" {
  description = "Prefix used to generate container names (<prefix>-0, <prefix>-1, ...)"
  type        = string
  default     = "nginx"
}

variable "starting_port" {
  description = "External port of the first container; the next ones use +1, +2, ..."
  type        = number
  default     = 8000
}
