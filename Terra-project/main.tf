module "ec2" {
  source = "./modules/EC2"
  ami = var.ami
  instance_type = var.instance_type
  public_subnet = var.public_subnet
}
module "S3_bucket" {
  source = "./module/S3_bucket"
  bucket_name = var.bucket_name
}
module "security_group" {
  source = "./modules/Security_group"
  inbound = var.inbound
  outbound = var.outbound
  vpc_varaiable = var.vpc_varaiable
}

module "network-module" {
  source = "./modules/Network"
  vpc_varaiable = var.vpc_varaiable
  public_subnet = var.public_subnet
  private_subnet = var.private_subnet

  # Egress
  eg_protocol = var.eg_protocol
  eg_action = var.eg_action
  eg_role_no = var.eg_role_no
  eg_cidr = var.eg_cidr
  eg_from_port = var.eg_from_port
  eg_to_port = var.eg_to_port

  # ingress
  in_protocol = var.in_protocol
  in_action = var.in_action
  in_role_no = var.in_role_no
  in_cidr = var.in_cidr
  in_from_port = var.in_from_port
  in_to_port = var.in_to_port
}