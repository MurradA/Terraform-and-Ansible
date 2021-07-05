# resource "aws_s3_bucket_object" "tfstate" {
#   bucket = aws_s3_bucket.s3b.bucket
#   key    = "environment_tfstate.tf"
#   source = "/Users/davidteeling/play/the_lads/terraform_Infrastructure/terraform.tfstate"
# }
