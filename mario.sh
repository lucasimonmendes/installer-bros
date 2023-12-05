#!/bin/bash

# Função de ajuda para exibir informações de uso da CLI
show_help() {
    echo "Uso: $0 <opção>"
    echo "Opções disponíveis:"
    echo "  -h, --help             Exibir esta mensagem de ajuda"
    echo "  -l, --linux            Instalar no Linux"
    echo "  -w, --windows          Instalar no Windows"
    echo "  -d, --download         Baixar repositórios do GitHub"
    echo "  -a, --all              Instalar no Linux e Baixar repositórios"
    echo "  -b, --both             Instalar no Windows e Baixar repositórios"
}

# Funções para as operações específicas
install_linux() {
  echo "Instalando Ambiente no Linux..."
  # 1. Instalação do Git
  sudo apt-get update
  sudo apt-get install -y git

  # 2. Configuração do Terminal
  # - Instalação do Zsh
  sudo apt-get install -y zsh

  # - Instalação das Nerd Fonts
  git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git ~/.nerd-fonts
  ~/.nerd-fonts/install.sh

  # - Instalação do Powerlevel10k
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k

  # - Instalação do Zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

  # - Instalação do zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

  # 3. Download e instalação das ferramentas
  # - Instalação do asdf
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
  echo ". $HOME/.asdf/asdf.sh" >> ~/.zshrc  # Configuração para o Zsh
  echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.zshrc  # Configuração para o Zsh

  # - Instalação de linguagens via asdf
  # Rust
  asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git
  asdf install rust latest
  asdf global rust latest

  # Node.js
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
  asdf install nodejs latest
  asdf global nodejs latest

  # Python
  asdf plugin-add python https://github.com/danhper/asdf-python.git
  asdf install python latest
  asdf global python latest

  # - Instalação do Neovim
  sudo apt-get install -y neovim
  
  # - Instalação do Lunarvim
  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
  echo "Saindo..."
}

install_windows() {
  echo "Para instalar no Ambiente Windows, utilize o outro script"
  echo "Saindo..."
}

download_repositories() {
  echo "Baixando repositórios do Github"
  # Criando a pasta workspace se não existir
  mkdir -p ~/workspace

  #Repositórios para download
  repos=(
    "https://github.com/lucasimonmendes/jarvis.git"
    "https://github.com/lucasimonmendes/lucasimonmendes.github.io.git"
    )
  
  # Loop para baixar e mover os repositórios
  for repo in "{repos[@]}"; do
    git clone "$repo" ~/workspace/"$(basename "$repo" .git)"
  done
  echo "Saindo..."
}

# Verificar se foram passados argumentos
if [ $# -eq 0 ]; then
  while true; do
    clear
    echo "======================="
    echo "HELLO! IT'S ME, MARIO!"
    echo "======================="
    echo "==== MENU ===="
    echo "1. Instalar Ambiente no Linux"
    echo "2. Instalar Ambiente no Windows"
    echo "3. Baixar repositórios do Github"
    echo "4. Instalar Ambiente no Linux e Baixar Repositórios"
    echo "5. Instalar no Windows e Baixar repositórios"
    echo "6. Sair"
    echo "=============="
    read -p "Escolha uma opção:" choice

    case $choice in
      1)
        install_linux
        exit 0
        ;;
      2)
        install_windows
        exit 0
        ;;
      3)
        download_repositories
        exit 0
        ;;
      4) 
        install_linux
        download_repositories
        exit 0
        ;;
      5)
        install_windows
        download_repositories
        exit 0
        ;;
      6)
        echo "Saindo..."
        exit 0
        ;;
      *)
        echo "Opção inválida!"
        ;;
    esac
    read -n -l -s -r -p "Pressione qualquer tecla para continuar..."
  done
else
    # Se argumentos forem passados, executar diretamente a opção
    case $1 in
      -h | --help)
        show_help
        ;;
      -l | --linux)
        install_linux
        exit 0
        ;;
      -w | --windows)
        install_windows
        exit 0
        ;;
      -d | --download)
        download_repositories
        exit 0
        ;;
      -a | --all)
        install_linux
        download_repositories
        exit 0
        ;;
      -b | --both)
        install_windows
        download_repositories
        exit 0
        ;;
      *)
        echo "Opção inválida!"
        show_help
        ;;
  esac
fi

