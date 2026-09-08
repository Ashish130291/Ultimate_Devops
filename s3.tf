resource "random_string" "random" {
  length = 6
  upper = false
  special = false
}

resource "aws_s3_bucket" "UltimateDevops_S3_Terrafrom_Backend" {
  bucket = "tfstate-ultimatedevops-s3-${random_string.random.result}"

  tags = merge(var.tags, {
    Name = "ultimatedevops-s3-terrafrom-backend-${random_string.random.result}"
  })
}