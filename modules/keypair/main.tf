resource "tls_private_key" "emr_key" {
  algorithm = "RSA"
  rsa_bits = 2048
}

resource "aws_key_pair" "emr_key" {
  key_name = "emr_key"
  public_key = tls_private_key.emr_key.public_key_openssh
}