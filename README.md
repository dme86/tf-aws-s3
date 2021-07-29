### terraform s3 module
This module enables you to create one (or more) S3 bucket/s with a list of (sub)folder/s.
eg

     |_ Bucketname1
     |_ Bucketname1
     |_ Bucketname3

or something like

    |_ Bucketname1
      |_ Folder_foo
      |_ Folder_bar
        |_ Folder_foo_bar
      |_ Folder_baz
    |_ Bucketname2
      |_ Folder_foo
      |_ Folder_bar
        |_ Folder_foo_bar
      |_ Folder_baz

## Examples for main.tf
This example will create **one** bucket with the folders *foo*, *bar*, *baz* & the subfolder *qux* inside *foo*:

```hcl
    module "s3" {
    source         = "github.com/dme86/tf-aws-s3?ref=v0.1"
    bucketnames    = ["example-s3-bucketname"]
    foldernames    = ["foo", "foo/qux", "bar", "baz"]
     tags          = {
       Owner       = "Terraform"
     }
    }
```

This example will only create **one** *empty* bucket:

```hcl
    module "s3" {
    source         = "github.com/dme86/tf-aws-s3?ref=v0.1"
    bucketnames    = ["example-s3-bucketname"]
    foldernames    = []
     tags          = {
       Owner       = "Terraform"
     }
    }
```

This example will only create **3** *empty* buckets:

```hcl
    module "s3" {
    source         = "github.com/dme86/tf-aws-s3?ref=v0.1"
    bucketnames    = ["example-s3-1", "example-s3-2", "example-s3-3"]
    foldernames    = []
     tags          = {
       Owner       = "Terraform"
     }
    }
```

## Attributes
|Attribute|Default|
|--|--|
|Versioning|On|
|ACL|Private|
|block_public_acls|true|
|block_public_policy|true|
|restrict_public_buckets|true|
