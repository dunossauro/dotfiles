# -*- mode: ruby -*-

Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  config.vm.box_version = "20241001.267073"

  config.vm.provision "shell", inline: <<-SHELL
    pacman -Syu --noconfirm
    pacman -S git ansible --noconfirm
    git clone https://codeberg.org/dunossauro/dotfiles.git
    cd dotfiles/playbooks
    ansible-playbook basic_arch.yml
  SHELL
end
