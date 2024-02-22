# Manjaro Linux Ansible Provision

> This repo is deprecated as my configuration repo. And I have migrated to a simple shell script approach. [GitHub - wickes1/Dotfiles](https://github.com/wickes1/Dotfiles)

## Why I don't continue this approach?

My initial thought is to utilize Ansible for my any devices, any new OS installation, and any new VMs so that I can have a consistent environment. But I found that it's too much overhead for my personal use. You won't have a lot of new devices to manage. What's more, the configuration was kept deprecating, that adding more overhead to maintain the configuration.

However, I mostly used Ansible as my dotfiles manager. So what's important is not the app installation, but the dotfiles. (For personal usage) So I migrate to a simple shell script approach. [GitHub - wickes1/Dotfiles](https://github.com/wickes1/Dotfiles)

## Contents

- [Manjaro Linux Ansible Provision](#manjaro-linux-ansible-provision)
  - [Why I don't continue this approach?](#why-i-dont-continue-this-approach)
  - [Contents](#contents)
  - [Usage](#usage)
    - [Prerequisites](#prerequisites)
    - [List tags](#list-tags)
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

### List tags

```bash
ansible-playbook playbook.yml --list-tags
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
