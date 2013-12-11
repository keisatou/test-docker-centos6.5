# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "opscode-centos65"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box"

  config.vm.provider :virtualbox do |vb|
    vb.name = "docker1"
    vb.customize ["modifyvm", :id, "--memory", 1024]
  end

  config.vm.network :private_network, ip: "192.168.33.32"

  config.vm.provision :shell, :inline => <<-EOT
    #
    # iptables off
    #
    /sbin/iptables -F
    /sbin/service iptables stop
    /sbin/chkconfig iptables off
    #
    # yum repository
    #
    rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
    #
    # docker
    #
    yum install -y docker-io
    chkconfig docker on
    service docker start
  EOT
end
