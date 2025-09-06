resource "aws_s3_bucket" "mi_bucket" {
  bucket = "daniela-bucket-terraform-linux-2024"

  tags = {
    Name        = "DanielaBucket"
    Environment = "Actividad"
    Owner       = "Daniela"
  }
}

resource "aws_s3_bucket_public_access_block" "bloqueo_publico" {
  bucket = aws_s3_bucket.mi_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}