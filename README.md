# dotfiles

Minhas configurações do i3, bash, rofi, terminator e emacs

## Uso geral
Estou usando o [dotdrop](https://dotdrop.readthedocs.io/en/stable/) para gerenciar os arquivos de configuração.

### Para pegar a configuração

```bash
pip install pipx
alias dotdrop='dotdrop --cfg=<this_repo>/config.yaml'
dotdrop install
```

### Para sincronizar a configuração
```bash
dotdrop update
```

## TODO

- Centralizar minhas configurações do carla em um diretório para migrar para o dotdrop
- Ajustar a configuração do qtile (não uso a um tempo)
- Revisitar o postinstall
