function git-alexmachina {
  git config --global user.name "Alex Alonso"
  git config --global user.email alex.xmde@gmail.com

  eval $(ssh-agent)
  ssh-add ~/.ssh/id_rsa_alexmachina
}

function git-alexvia {
  git config --global user.name "Alex Alonso"
  git config --global user.email alex.alves-ext@viavarejo.com.br

  eval $(ssh-agent)
  ssh-add ~/.ssh/id_rsa
}
