# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "Zelec/manjarolinux"

  # not needed for build testing purposes
  config.ssh.insert_key = false

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provider :virtualbox do |v|
    v.memory = 1024
    v.linked_clone = true
  end

  # Desktop 
  config.vm.define "manjaroVM" do |app|
    app.vm.hostname = "manjaro-build.test"
    app.vm.network :private_network, ip: "192.168.56.2"
  end

end
