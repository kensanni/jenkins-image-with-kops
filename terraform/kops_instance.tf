provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

data "aws_ami" "jenkins_kops" {
  most_recent = true

  filter {
    name = "name"
    values = ["jenkins_with_kops *"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["753379358044"]
}

resource "aws_instance" "kops_instance" {
  ami           = "${data.aws_ami.jenkins_kops.id}"
  instance_type = "t2.micro"
  key_name      = "test-run"
  security_groups = ["kops_sg"]
  tags {
    Name = "Jenkins_with_kops"
  }
}

resource "aws_eip" "elastic_ip" {
  instance = "${aws_instance.kops_instance.id}"
}
