 ```
  _____   ____ _______ ______ _____ _      ______  _____     ___   ___ ___  __ 
 |  __ \ / __ \__   __|  ____|_   _| |    |  ____|/ ____|   |__ \ / _ \__ \/_ |
 | |  | | |  | | | |  | |__    | | | |    | |__  | (___        ) | | | | ) || |
 | |  | | |  | | | |  |  __|   | | | |    |  __|  \___ \      / /| | | |/ / | |
 | |__| | |__| | | |  | |     _| |_| |____| |____ ____) |    / /_| |_| / /_ | |
 |_____/ \____/  |_|  |_|    |_____|______|______|_____/    |____|\___/____||_|
 
 O estado da arte, agora no WSL 2️⃣0️⃣2️⃣1️⃣
 ```
                                                                               
                                                                               

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
