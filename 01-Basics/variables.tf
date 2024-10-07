variable "default_location" {
  description = "Default location for all resources in this project"
  type        = string
  default     = "northeurope"
}

variable "default_tags" {
  description = "Default tags for all resources in this project."
  type        = map(string)
  default = {
    Environment = "Demo"
    Project     = "Terraform Training"
  }
}

variable "number_of_rg" {
  description = "The number of Resource Groups we want to create using `count`."
  type        = number
  default     = 0
}

variable "rg_by_location" {
  description = "A map we use to create resource groups using `for_each`."
  type        = map(string)
  default = {
    first  = "northeurope"
    second = "westeurope"
    third  = "germanywestcentral"
  }
}
