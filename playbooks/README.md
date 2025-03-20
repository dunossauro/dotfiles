Para iniciar

```
pacman -Syu --noconfirm
pacman -S git ansible --noconfirm
git clone https://codeberg.org/dunossauro/dotfiles.git
cd dotfiles/playbooks
ansible-playbook basic_arch.yml
ansible-galaxy collection install -r requirements.yml
ansible-playbook tasks.yml
```

restartar o sistema e aí vida que segue :)
