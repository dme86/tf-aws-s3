variable "tags" {}

variable "foldernames" {
  type    = list
  default = []
}

variable "bucketnames" {
  type    = list
  default = []
}

variable "acl" {
  type    = string
  default = "private"
}

variable "versioning" {
  default = "true"
}

variable "block_public_acls" {
  default = "true"
}

variable "block_public_policy" {
  default = "true"
}

variable "restrict_public_buckets" {
  default = "true"
}
