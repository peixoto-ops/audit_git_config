#!/bin/bash

# ==============================================================================
# Script: audit_git_config.sh
# Autor: Peixoto-Ops
# Objetivo: Auditar configurações do Git, identificar duplicatas e exportar relatório.
# Dependências: git, xclip
# Metodologia: DRY (Don't Repeat Yourself) - Funções reutilizáveis e variáveis.
# ==============================================================================

# --- 1. Definição de Constantes (Estilo e Formatação) ---
# Usar variáveis para cores facilita a manutenção e leitura (Abstração).
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color (Reset)

# Cabeçalho do relatório
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
HEADER="${BOLD}RELATÓRIO DE AUDITORIA GIT CONFIG - ${TIMESTAMP}${NC}"

# --- 2. Funções (Lógica Modular) ---

# Função para capturar a configuração bruta com a origem (arquivo onde está definido)
# O flag --show-origin é crucial para saber se o config está no Sistema, Global ou Local.
get_git_origins() {
    echo -e "\n${BLUE}[1] Mapeamento de Origem (Onde cada config está definida):${NC}"
    git config --list --show-origin
}

# Função para detectar estritamente linhas duplicadas
# sort: Ordena para que linhas iguais fiquem adjacentes.
# uniq -d: Exibe APENAS as linhas que se repetem (o problema a ser resolvido).
get_duplicates() {
    echo -e "\n${BLUE}[2] Detecção de Redundância (Linhas idênticas):${NC}"
    duplicates=$(git config --list | sort | uniq -d)
    
    if [ -z "$duplicates" ]; then
        echo -e "${GREEN}Nenhuma duplicata exata encontrada.${NC}"
    else
        echo -e "${RED}ALERTA: Configurações duplicadas detectadas:${NC}"
        echo "$duplicates"
    fi
}

# --- 3. Execução Principal (Main Loop) ---

# Captura todo o output para uma variável (Buffer) para processar uma única vez (DRY)
# Assim podemos imprimir na tela E mandar para o xclip sem rodar os comandos duas vezes.
REPORT_CONTENT=$(
    echo -e "$HEADER"
    echo "--------------------------------------------------------"
    get_git_origins
    echo "--------------------------------------------------------"
    get_duplicates
    echo "--------------------------------------------------------"
    echo -e "${BOLD}Fim do Relatório.${NC}"
)

# --- 4. Saída de Dados (I/O) ---

# Output 1: Stdout (Terminal)
echo "$REPORT_CONTENT"

# Output 2: Clipboard (Xclip)
# Remove códigos de cor ANSI antes de copiar para garantir texto limpo no clipboard.
# sed 's/\x1b\[[0-9;]*m//g': Regex para limpar formatação de terminal.
echo "$REPORT_CONTENT" | sed 's/\x1b\[[0-9;]*m//g' | xclip -selection clipboard

echo -e "\n${GREEN}✔ Relatório gerado e copiado para a área de transferência.${NC}"
