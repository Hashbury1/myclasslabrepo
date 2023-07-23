

resource "aws_instance" "server-demo" {
  ami           = "ami-05548f9cecf47b442"
  instance_type = "t2.micro"

  tags = {
    Name = "terra-server"
  }
}