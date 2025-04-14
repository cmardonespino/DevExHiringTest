data "template_file" "install" {
  template = file("install.tpl")
}

resource "aws_instance" "bastion" {
  ami                         = "ami-0f9de6e2d2f067fca"
  instance_type               = "t3a.micro"
  iam_instance_profile        = aws_iam_instance_profile.bastion_profile.name
  #key_name                    = aws_key_pair.kp.key_name
  vpc_security_group_ids      = [data.aws_security_group.default.id]
  subnet_id                   = data.aws_subnets.private.ids[0]
  associate_public_ip_address = "false"
  user_data_base64            = base64encode(data.template_file.install.rendered)

  root_block_device {
    volume_type           = "gp3"
    volume_size           = "30"
    delete_on_termination = true
    encrypted             = true
  }
  tags = {
    Name           = "bastion"
  }

  lifecycle {
    ignore_changes = [
      user_data_base64
    ]
  }
}