# vm vars

variable "vms_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "https://yandex.cloud/ru/docs/compute/concepts/image#family"
}

variable "vms_resources" {
  type = map(any)
  default = {
    web = {
      platform_id   = "standard-v2"
      cores         = 2
      memory        = 1
      core_fraction = 5
      preemptible   = true
      nat           = true
    }
    db = {
      platform_id   = "standard-v2"
      cores         = 2
      memory        = 2
      core_fraction = 20
      preemptible   = true
      nat           = true
    }
  }
}
