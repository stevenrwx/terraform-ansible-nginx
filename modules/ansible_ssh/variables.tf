variable "host" {
description = "host"
}

variable "private_key" {
description = "private sshkey"
}
variable "command" {
description = "command"
}

variable "run_ssh" {
description = "bool"
default = false
}

variable "run_ansible" {
description = "bool"
default = false
}

variable "playbook" {
description = "playbooks"
default = false
}

variable "private_key_name" {
description = "private key name"
default = false
}

variable "ipv4_host" {
description = "ipv4_host"
default = false
}