output "emr_log_uri" {
  value = "s3://${aws_s3_bucket.my_bucket.bucket}/logs/"
  description = "S3 URI for EMR logs"
}
