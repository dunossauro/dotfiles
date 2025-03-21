# -*- mode: ruby -*-

Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  config.vm.provider "virtualbox" do |vm|
    vm.memory = 2048
    vm.cpus = 4
    vm.customize [ "modifyvm", :id, "--vram", 256 ]
    vm.customize [ "modifyvm", :id, "--audio-driver", "default" ]
    vm.customize [ "modifyvm", :id, "--audio-enabled", "on" ]
    vm.customize [ "modifyvm", :id, "--audio-out", "on" ]
    vm.customize [ "modifyvm", :id, "--graphicscontroller", "vmsvga" ]
    vm.customize [ "modifyvm", :id, "--accelerate-3d", "on" ]
  end

  config.vm.provision "shell", inline: <<-SHELL
    pacman -Syu git ansible wget --noconfirm
    wget https://codeberg.org/dunossauro/dotfiles/raw/branch/main/playbooks/basic_arch.yml
    ansible-playbook basic_arch.yml
  SHELL
end

