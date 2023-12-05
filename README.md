# Mario e Luigi, Irmãos Instaladores de Setup

Este repositório contém scripts de instalação para configurar seu ambiente de desenvolvimento no Windows(Luigi) e no Ubuntu(Mario). Os scripts instalam ferramentas e configuram o ambiente para facilitar o desenvolvimento nas linguagens Javascript, Rust e Python.

## Instalação

### Windows

Para instalar as ferramentas no ambiente Windows:

1. Certifique-se de ter o PowerShell com privilégios de administrador.
2. Clone este repositório:

    ```bash
    git clone https://github.com/lucasimonmendes/installer-bros.git
    ```

3. Navegue até o diretório do projeto e execute o script `luigi.ps1`:

    ```powershell
    cd installer-bros
    .\luigi.ps1
    ```

### Ubuntu

Para instalar as ferramentas no ambiente Ubuntu/WSL:

1. Certifique-se de ter o Bash instalado (para executar o script no WSL).
2. Clone este repositório:

    ```bash
    git clone https://github.com/lucasimonmendes/installer-bros.git
    ```

3. Navegue até o diretório do projeto e execute o script `mario.sh`:

    ```bash
    cd installer-bros
    chmod +x mario.sh
    ./mario.sh
    ```

## Ferramentas Instaladas

- **Git:** Controle de versão para gerenciamento de código.
- **Zsh:** Shell interativo para melhorar a experiência do terminal.
- **Neovim:** Editor de texto poderoso.
- **Node.js:** Plataforma para execução de JavaScript.
- **Python:** Linguagem de programação versátil.
- **Rust:** Linguagem de programação de sistemas.
- **Outras dependências e configurações**: Ferramentas adicionais podem ser encontradas nos scripts de instalação para cada ambiente.

## Observações

- Certifique-se de revisar os scripts de instalação antes de executá-los, pois eles podem conter comandos que podem alterar o ambiente do sistema.
- Os scripts podem precisar de ajustes dependendo do ambiente específico.
- Em caso de problemas durante a instalação, consulte a documentação oficial das ferramentas ou entre em contato com a comunidade de suporte.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para enviar pull requests para melhorar os scripts de instalação ou adicionar novas funcionalidades.

## Licença

Este projeto está sob a licença [Sua Licença Aqui]. Consulte o arquivo LICENSE para mais detalhes.

