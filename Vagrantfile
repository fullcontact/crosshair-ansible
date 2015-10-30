# -*- mode: ruby -*-
# vi: set ft=ruby :

hosts = [ { name: 'crosshair-ansible', cpu_cap: "100", cpus: "2", ram: "1024" }]

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  hosts.each do |host|
    config.vm.define host[:name] do |node|
      node.vm.hostname = host[:name]
      node.vm.box = "boxcutter/ubuntu1404"
      node.vm.provider :virtualbox do |vb|
        vb.name = host[:name]
        vb.customize ["modifyvm", :id, "--cpuexecutioncap", host[:cpu_cap]]
        vb.customize ["modifyvm", :id, "--memory", host[:ram]]
        vb.customize ["modifyvm", :id, "--cpus", host[:cpus]]
      end
    end

    config.vm.synced_folder ".", "/vagrant"

    # information on available options.
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = ENV['PLAYBOOK_FILE']
      ansible.verbose = 'vv'
      ansible.sudo = true
    end
  end
end
