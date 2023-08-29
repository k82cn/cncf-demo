# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'

Vagrant.configure("2") do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "generic/ubuntu2004"
  config.vm.box_version = "4.2.16"
  config.vm.hostname = "cncf-demo"

  config.vm.boot_timeout = 600

  config.vm.network :public_network,
    :dev => "ens9f0"

  config.vm.provider "libvirt" do |vb|
    vb.memory = "4096"
    vb.cpus = "4"
    vb.management_network_autostart = true
    vb.nested = true
    vb.cpu_mode = "custom"
    vb.cpu_model = 'IvyBridge'

  end

  config.vm.provision :docker

  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  # SHELL

end
