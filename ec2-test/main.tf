resource "aws_instance" "myinstance" {
  ami                     = "ami-062f7200baf2fa504"
  instance_type           = "t2.micro"
}
