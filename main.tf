module "vpc" {
  source = "./modules/aws_vpc"

  vpc_cidr_block       = "10.1.0.0/16"
  subnet_public_cidr   = "10.1.1.0/24"
  subnet_public_cidr_2 = "10.1.2.0/24"
  subnet_private_cidr  = "10.1.100.0/24"

}
module "ec2_bastion" {
  source = "./modules/aws_ec2"

  public_subnet      = module.vpc.public_subnet
  availability_zone  = module.vpc.AZ_1
  security_group_web = module.vpc.security_group_ssh
  instance_type      = "t2.micro"
  create_public_ec2  = true
  create_public_ip   = true
  key_name           = "bastion-test"

}

module "bastion_config" {
  source = "./modules/ansible_ssh"

  run_ssh = true
  host = module.ec2_bastion.public_ip
  private_key = module.ec2_bastion.private_key
  command = "uptime"


  run_ansible = true
  ipv4_host = module.ec2_bastion.public_ip
  private_key_name = "bastion-test.pem"
  playbook = "nginx.yml"
}