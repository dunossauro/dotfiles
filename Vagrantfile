# -*- mode: ruby -*-

Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"

  config.vm.provision "shell", inline: <<-SHELL
    pacman -Syu git ansible wget --noconfirm
    wget https://codeberg.org/dunossauro/dotfiles/raw/branch/main/playbooks/basic_arch.yml
    ansible-playbook basic_arch.yml
    ansible-galaxy collection install -r dotfiles/playbooks/requirements.yml
  SHELL
end
