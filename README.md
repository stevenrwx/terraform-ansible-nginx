# terraform-ansible-nginx
creates and deploy public EC2 in AWS, configures the machine using ansible in one procedure
- requires ansible 2.10.8
- requires Terraform v1.3.8

## Infrastructure components
main.tf contains the vpc, ec2 and ansible_ssh config

- VPC: 2 public subnets and 1 private subnet using natgateway for internet connectivity outbound
- EC2: creates 1 ec2 instance in public subnet with port 80 & 22 open also sshkey is created
- ansible_ssh: ssh to ec2 (bastion) using the private sshkey and public ip

## Terraform modules
located in the ./modules/ path

## Useful commands
- `sudo make install` shows the expected output of 17 resources
- `sudo make install-approve` 
- `sudo make destroy`

## expected results
- created public EC2 hosting nginx welcome page on port 80
- automated configuration by ansible
