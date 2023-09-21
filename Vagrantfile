# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'

NET_DEV="cncf-br"

Vagrant.configure("2") do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "debian/bullseye64"
#  config.vm.box = "generic/ubuntu2004"
#  config.vm.box_version = "4.2.16"
  config.vm.hostname = "cncf-demo"

  config.vm.boot_timeout = 600

  config.vm.network :public_network,
    :dev => NET_DEV,
    :ovs => true,
    :mode => "passthrough"


  config.vm.provider "libvirt" do |vb|
    vb.memory = "4096"
    vb.cpus = "4"
    vb.management_network_autostart = true
#     vb.nested = true
#     vb.cpu_mode = "custom"
#     vb.cpu_model = 'IvyBridge'
  end

  # Install docker by Vagrant
  config.vm.provision :docker

end
