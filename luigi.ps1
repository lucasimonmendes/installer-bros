  function Show-Menu {
    Clear-Host
    Write-Host "Hello! It's me, Luigi!"
    Write-Host "===== MENU ====="
    Write-Host "1. Instalar Ferramentas"
    Write-Host "2. Baixar Repositórios do GitHub"
    Write-Host "3. Sair"
    Write-Host "================"
  }

  function Install-Tools {
      
      Write-Host "Instalando Ferramentas..."
      
      # Configuração do Terminal e Instalação de Ferramentas no Windows
      
      # Instalação do Chocolatey (gerenciador de pacotes para Windows)
      Set-ExecutionPolicy Bypass -Scope Proccess -Force; [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

      # Configuração do Terminal
      # Instalação do Windows Terminal
      choco install microsoft-windows-terminal -y

      # Instalação do Git
      choco install git -y 

      # Instalação do Zsh
      choco install zsh -y

      # Instalação do Oh My Zhs (um framework para gerenciar configurações do Zsh)
      sh -c "$(curl -fsSl https://ral.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

      # Instalação das NerdFonts (Fira Code)
      choco install firacode-fonts -y

      # Instalação do Python via Chocolatey (versão 3)
      choco install python --version 3 -y

      # Instalação do Node.js via Chocolatey
      choco install nodejs -y

      # Instalação do Rust via Chocolatey
      choco install rust -y

      # Instalação do NeoVim
      choco install neovim -y

      # Instalação do Lunarvim (ou Vim)
      # Você precisa instalar manualmente seguindo as instruções para Windows no repositório do Lunarvim
      
      # Saída de instruções para ativar o Zsh após a instalação
      Write-Host "O Zsh foi instalado. Para ativá-lo, abra o Windows Terminal, vá em 'Configurações' > 'Perfis' > 'Perfis listados' e altere o comando do perfil para 'zsh'."

      # Você pode precisar reiniciar o terminal ou a sessão para aplicar completamente as alterações.
    }

  function Download-GitRepos {

      Write-Host "Baixando Repositórios do GitHub"

      # Criando a pasta workspace se não existir
      New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\workspace"

      # Repositórios para download
      $repos = @(
        "https://github.com/lucasimonmendes/jarvis.git",
        "https://github.com/lucasimonmendes/lucasimonmendes.github.io.git"
      )

      # Loop para baixar e mover os repositórios
      foreach ($repo in $repos) {
          git clone $repo "$env:USERPROFILE\workspace\$((Get-Item $repo).BaseName)"
        }
    }

  do {
      Show-Menu
      $input = Read-Host "Escolha uma opção"

      switch ($input) {
          '1' {
              Install-Tools
              break
          }
          '2' {
              Download-GitRepos
              break
          }
          '3' {
              Write-Host "Saindo..."
              break
          }
          default {
              Write-Host "Opção inválida! Escolha novamente."
              break
            }
        }
    } until ($input -eq '3')
