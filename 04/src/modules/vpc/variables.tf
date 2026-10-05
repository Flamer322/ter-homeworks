variable "name" {
  type = string
}

variable "subnets" {
  type = list(
    object({
      zone = string,
      cidr = string
    })
  )
}
