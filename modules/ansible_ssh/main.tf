resource "null_resource" "config_ec2" {
    count = var.run_ssh ? 1 : 0

    connection {
        host = var.host
        type = "ssh"
        user = "ubuntu"
        private_key = var.private_key
    }

    provisioner "remote-exec" {
        inline = [var.command]

    }

  }


resource "null_resource" "ansible_ec2" {
    count = var.run_ansible ? 1 : 0

    connection {
        host = var.host
        type = "ssh"
        user = "ubuntu"
        private_key = var.private_key
    }

    provisioner "local-exec" {
        command = "echo ${var.host} > ${path.cwd}/ansible/hosts"
    }    

    provisioner "local-exec" {
        command =<<EOT
        sudo ansible-playbook -u ubuntu -i ${path.cwd}/ansible/hosts --private-key ${path.cwd}/${var.private_key_name} ${path.cwd}/ansible/${var.playbook}
    EOT
    }

    depends_on = [null_resource.config_ec2]

}