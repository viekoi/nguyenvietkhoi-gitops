


variable "format" {
  description = "Format for AR"
  type        = string
  default     = "docker"

}

variable "mode" {
  description = "Mode for AR"
  type        = string
  default     = "STANDARD_REPOSITORY"

}

variable "description" {
  description = "Description for AR"
  type        = string
  default     = "Artifact Registry for nguyenvietkhoi Nextjs app"

}

variable "labels" {
  description = "Labels for AR"
  type        = map(string)
  default = {

  }
}



variable "gcp_project" {
  description = "Project in which GCP Resources to be created"
  type        = string
  default     = "nguyenvietkhoi"
}

variable "gcp_project_id" {
  description = "Project in which GCP Resources to be created"
  type        = string
  default     = "nguyenvietkhoi-466304"
}


variable "gcp_region" {
  description = "Region in which GCP Resources to be created"
  type        = string
  default     = "us-central1"
}

variable "gcp_region_zone" {
  description = "Zone of a region in which GCP Resources to be created"
  type        = string
  default     = "us-central1-a"
}

variable "repo_name" {
  description = "Name of this repo"
  type        = string
  default     = "nguyenvietkhoi-fe"
}






