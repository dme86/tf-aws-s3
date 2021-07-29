# create a combined data structure
locals {

  buckets_and_folders = merge([
    for bucket in var.bucketnames:
      {
        for folder in var.foldernames:
        "${bucket}-${folder}" => {
          bucket = bucket
          folder = folder
        }
      }
  ]...)

}

# create some s3 buckets
resource "aws_s3_bucket" "this" {
  count                   = "${length(var.bucketnames)}"
  bucket                  = "${element(var.bucketnames, count.index)}"
  acl                     = var.acl
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  restrict_public_buckets = var.restrict_public_buckets
  versioning {
    enabled               = var.versioning
  }
  tags = {
    Owner                 = "Terraform"
	}
}

# generate folderstructure in every bucket
resource "aws_s3_bucket_object" "folders" {

    for_each = local.buckets_and_folders

    bucket   = each.value.bucket
    acl      = var.acl
    key      = format("%s/", each.value.folder)
    source   = "/dev/null"
    depends_on = [
      aws_s3_bucket.this,
    ]
}
