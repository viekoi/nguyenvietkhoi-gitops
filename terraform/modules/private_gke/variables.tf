
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

variable "gcp_project_number" {
  description = "Project number"
  type        = string
  default     = "156278491748"
}


variable "gcp_region" {
  description = "Region in which GCP Resources to be created"
  type        = string
  default     = "us-central1"
}


variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "dev"
}


variable "subnet_ip_range" {
  description = "Subnet IP range"
  type        = string
  default     = "10.128.0.0/20" # Total 4096 IPs (10.128.0.0 - 10.128.31.255)
}

variable "pods_ip_range" {
  description = "Kubernetes Pods IP range"
  type        = string
  default     = "10.129.0.0/21" #  (10.128.0.0 - 10.128.7.255)  
}

variable "services_ip_range" {
  description = "Kubernetes Services IP range"
  type        = string
  default     = "10.129.8.0/22" #  (10.128.8.0 - 10.128.11.255) 
}

variable "master_ip_range" {
  description = "Kubernetes Master IP range"
  type        = string
  default     = "10.129.12.0/28" # 14 IPs (10.128.12.0 - 10.128.12.15)
}


