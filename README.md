# bootstrap.sh
- Adiciona o index.sh no `.bashrc`.
- Faz o link do init.vim
```bash
   bash bootstrap.sh
```
# adda.sh
criação rápida de alias
```bash
    adda gs "git status"
    # OU
    git status
    adda gs # Cria um alias gs=git status
```

# init.vim
meu vimrc
```bash
  ln -s /home/alex/scripts/init.vim /home/alex/.config/nvim/init.vim
```

## TODO

1. Parametrizar arquivo de alias com variável de ambiente
2. Dar source automatico nos .sh da pasta scripts
