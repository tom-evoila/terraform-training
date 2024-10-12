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

variable "subscription_id" {
  description = "(Required) The Subscription ID which should be used."
  type        = string
}
