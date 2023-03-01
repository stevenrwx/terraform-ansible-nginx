output bastion_ip {
    value = module.ec2_bastion.public_ip
}