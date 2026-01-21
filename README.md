# 🛡️ Audit Git Config

> **Ferramenta de auditoria automatizada para higiene de configurações Git e conformidade com o princípio DRY.**

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Bash](https://img.shields.io/badge/Language-Bash-blue.svg)
![Status](https://img.shields.io/badge/Status-Active-green.svg)

![Fluxo Lógico de Auditoria](resources/draft_image.png)

## 📋 Visão Geral

O **Audit Git Config** é um script shell desenvolvido para resolver o problema de configurações "sombra" ou redundantes que se acumulam nos diferentes escopos do Git (`System`, `Global`, `Local`).

Seu objetivo principal é garantir a integridade da configuração, identificando duplicatas que violam o princípio **DRY (Don't Repeat Yourself)** e facilitando a depuração.

## 🚀 Funcionalidades

- **📍 Mapeamento de Origem:** Rastreia exatamente em qual arquivo (`/etc/gitconfig`, `~/.gitconfig`, `.git/config`) cada variável está definida usando `--show-origin`.
- **🔍 Detecção de Redundância:** Algoritmo que isola e alerta sobre linhas de configuração duplicadas exatas.
- **📋 Clipboard I/O:** Gera o relatório no `stdout` e, simultaneamente, copia a versão limpa (sem códigos de cor ANSI) para a área de transferência (requer `xclip`).
- **📄 Documentação Automática:** Inclui gerador de documentação (`gerador_docs.sh`) para padronização rápida de novos repositórios.

## 📂 Estrutura do Projeto

```text
.
├── audit_git_config.sh    # Core: Script de auditoria e geração de relatório
├── gerador_docs.sh        # Util: Gera README, LICENSE e arquivos padrão
├── resources/             # Assets: Imagens e diagramas
│   └── draft_image.png    # Visual Abstract: Fluxo Lógico
├── README.md              # Doc: Este arquivo
└── LICENSE                # Legal: Licença MIT