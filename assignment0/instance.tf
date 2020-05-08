###################################
### Phase-1 ###
##################################

### Region ###

provider "aws" {
  region = "ap-south-1"
}

### EC2 Instance Creation ###

resource "aws_instance" "lab01" {
  ami               = var.AMIS[var.AWS_REGION]
  instance_type     = "t2.micro"
  key_name          = var.PATH_TO_PRIVATE_KEY
  availability_zone = "ap-south-1a"
  security_groups   = ["${aws_security_group.web-node.name}"]
  provisioner "local-exec" {
    command = "echo ${aws_instance.lab01.private_ip} >> private_ips.txt"
  }
  tags = {
    Name        = "example-web"
    Environment = "Test"
  }

  root_block_device {
    volume_size = "10"
    volume_type = "standard"
  }

}

### Attach first standard storage disk of 10 GB ###



resource "aws_ebs_volume" "disk01" {
  availability_zone = "ap-south-1a"
  size              = 10
  type              = "standard"

  tags = {

    Name = "example-web-disk01"
  }
}

resource "aws_volume_attachment" "disk01" {
  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.disk01.id
  instance_id = aws_instance.lab01.id
}

## Attached Second Disk 
resource "aws_ebs_volume" "disk02" {
  availability_zone = "ap-south-1a"
  size              = 8
  type              = "standard"

  tags = {

    Name = "example-web-disk02"
  }
}

resource "aws_volume_attachment" "disk02" {
  device_name = "/dev/xvdc"
  volume_id   = aws_ebs_volume.disk02.id
  instance_id = aws_instance.lab01.id
}
#
#




#End

