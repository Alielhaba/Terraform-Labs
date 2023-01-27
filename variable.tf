variable "ami_id" {
  type        = string
}

variable "inestace-type" {
  type        = string
}

variable "SG-name" {
  type        = list
}

variable "instance-name" {
  type        = list
}

variable "tables-name" {
  type        = list
}

variable "sub-ip" {
  type        = list
}

variable "nat-gw" {
  type        = string
}

variable "vpc-cider" {
  type        = string
}


# variable "s3-name" {
#   type        = list
# #   default     = [ "S3-1" , "s3-2" ]
# }
# # var.s3- name[1]
# variable "s3- name" {
#   type        = map
#   default     = {
#     "bucket1":"s3-1",
#     "bucket2":"s3-2"
#   }
# }
# # var.s3- name[bucket1]
