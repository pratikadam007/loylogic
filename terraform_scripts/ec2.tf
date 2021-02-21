resource "aws_instance" "spring_jenkins_public" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.spring-public.id

  # the security group
  vpc_security_group_ids = [aws_security_group.jenkins.id]

  user_data = data.template_cloudinit_config.cloudinit-spring-public.rendered
}

resource "aws_instance" "spring_jenkins_private" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.spring-private.id

  # the security group
  vpc_security_group_ids = [aws_security_group.jenkins.id]

  user_data = data.template_cloudinit_config.cloudinit-spring-private.rendered
}