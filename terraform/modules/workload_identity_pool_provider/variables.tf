
variable "provider_name" {
  type    = string
  default = "Github"

}

variable "description" {
  type    = string
  default = "GitHub Actions identity pool provider for automated of nguyenvietkhoi-fe"

}

variable "repo_path" {
  type    = string
  default = "viekoi/nguyenvietkhoi"
}

variable "gcp_project" {
  description = "Project in which GCP Resources to be created"
  type        = string
  default     = "nguyenvietkhoi"
}

variable "gcp_project_id" {
  description = "Project ID"
  type        = string
  default     = "nguyenvietkhoi-466304"
}

variable "gcp_region" {
  description = "Region in which GCP Resources to be created"
  type        = string
  default     = "us-central1"
}
