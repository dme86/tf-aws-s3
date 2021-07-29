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
