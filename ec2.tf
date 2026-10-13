resource "aws_security_group" "hello_all_ssh" {
    description = "this is created for allow port number ssh"
    name = "allow_ssh"

    tags = {
      Name = "allow_ssh"
      Created_by ="terraform"
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]

  }

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "TCP"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]

  }
  
}

resource "aws_instance" "expense" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t3.micro"
  key_name = "dockerpractice"
  vpc_security_group_ids = [aws_security_group.hello_all_ssh.id]

  tags = {
    Name = "Expense"
  }
}
