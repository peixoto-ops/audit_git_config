#!/usr/bin/env bash
set -euo pipefail

# gerador_docs.sh
# Gera README.md, DOCUMENTAÇÃO.md e LICENSE (MIT) para o projeto audit_git_config
# Autor: Peixoto-Ops / p31x070 (gerado automaticamente)
# Idioma: pt-BR
# Comportamento: cria/overwrite dos arquivos e faz git add/commit automático
#
# Uso:
#   chmod +x gerador_docs.sh
#   ./gerador_docs.sh
#
# Observação: se não estiver em um repositório Git, o script inicializa um (git init)
# e faz o commit. Ajuste o autor do commit se desejar.

REPO_DIR="$(pwd)"
README_FILE="README.md"
DOC_FILE="DOCUMENTAÇÃO.md"
LICENSE_FILE="LICENSE"

# Conteúdo do README.md (pt-BR)
cat > "${README_FILE}" <<'README_EOF'
# audit_git_config

Relatório automático de auditoria das configurações do Git. Identifica onde cada configuração está definida (origem), detecta duplicatas exatas e copia o relatório para a área de transferência.

Autor: Peixoto-Ops  
Linguagem: Shell (Bash)  
Dependências: git, xclip (para copiar ao clipboard; alternativas descritas abaixo)  
Licença: MIT

## Sumário
- Descrição
- Requisitos
- Instalação
- Uso
- Exemplos e saída esperada
- Erros comuns / Troubleshooting
- Contribuição
- Licença

## Descrição
O script `audit_git_config.sh` gera um relatório com:
- Mapeamento de origem das configurações (`git config --list --show-origin`)
- Detecção de linhas duplicadas exatas nas configurações (`git config --list | sort | uniq -d`)

O relatório é mostrado no terminal e copiado para a área de transferência (clipboard) após remover as sequências de cor ANSI.

## Requisitos
- git (>= 2.x)
- Bash
- xclip (Linux). Para macOS use `pbcopy` e para Windows (Git Bash) use `clip`.

Instalação do xclip (exemplos):
- Debian/Ubuntu: `sudo apt update && sudo apt install -y xclip`
- Fedora: `sudo dnf install -y xclip`
- Arch: `sudo pacman -S xclip`

## Instalação / Preparação
1. Salve o script `audit_git_config.sh` no diretório do projeto (se ainda não existir).
2. Torne executável:
   ```bash
   chmod +x audit_git_config.sh
   ```
README_EOF

