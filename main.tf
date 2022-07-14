resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {

    edit                 = "leo"
    env                  = "master"
    git_commit           = "N/A"
    git_file             = "main.tf"
    git_last_modified_at = "2022-07-14 15:36:36"
    git_last_modified_by = "leosaragih001@gmil.com"
    git_modifiers        = "leosaragih001"
    git_org              = "saktil"
    git_repo             = "ci-yor"
    team_ownership       = "sre-intern"
    upload-to-gcb        = "cloud-build"
    yor_trace            = "ca53ac32-bcf2-4f1e-885d-175c97e3d92b"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {

    edit           = "leo"
    env            = "master"
    team_ownership = "sre-intern"
    upload-to-gcb  = "cloud-build"
    yor_trace      = "6d456f1b-d33c-4d26-a4fe-7ae61eff060e"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {

    edit           = "leo"
    env            = "master"
    team_ownership = "sre-intern"
    upload-to-gcb  = "cloud-build"
    yor_trace      = "c51f65fa-a115-4338-b352-4eca02993228"
  }
}

resource "aws_instance" "foo" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }
  tags = {

    edit           = "leo"
    env            = "master"
    team_ownership = "sre-intern"
    upload-to-gcb  = "cloud-build"
    yor_trace      = "b0aa9de5-66d6-41bc-b563-c1202bb87453"
  }

}

