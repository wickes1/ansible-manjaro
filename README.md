# Manjaro Linux Ansible Provision

## Contents

- [Manjaro Linux Ansible Provision](#manjaro-linux-ansible-provision)
  - [Contents](#contents)
  - [Usage](#usage)
    - [Prerequisites](#prerequisites)
    - [Production](#production)
    - [Testbuild Vagrant](#testbuild-vagrant)
    - [Testbuild VM](#testbuild-vm)
  - [Playbook Roles](#playbook-roles)

## Usage

### Prerequisites

```bash
# install ansible aur
ansible-galaxy collection install kewlfft.aur
# refresh known_hosts
ssh-keygen -R "192.168.56.2"
```


### Production

```bash
ansible-playbook playbook.yml -l localhost --extra-vars="username=<username>" --ask-become-pass
```


### Testbuild Vagrant

- vagrant setup

```bash
# load module
sudo /sbin/rcvboxdrv
vagrant up --provider virtualbox --provision
```

- without

```bash
ansible-playbook playbook.yml -l testbuild --extra-vars="username=vagrant" --ask-become-pass
```

- with debugging

```bash
ansible-playbook -vvvv playbook.yml -l testbuild --extra-vars="username=vagrant" --ask-become-pass --tags base
```

### Testbuild VM

```bash
ansible-playbook playbook.yml -l testbuild_vm --extra-vars="username=manjaro" --ask-pass --ask-become-pass --tags base
```


## Playbook Roles

Roles supported:

| Roles       | Description                               |
| ----------- | ----------------------------------------- |
| base        | Utils that exists under any circumstances |
| users       | Linux users and groups                    |
| development | Development environment and tools         |
| apps        | Any other applications                    |
