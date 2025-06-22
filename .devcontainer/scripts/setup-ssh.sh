#!/bin/bash

echo "🔐 Configurando agente SSH para Codespaces..."

# Inicia el agente SSH
eval "$(ssh-agent -s)"

# GitHub Codespaces ya configura SSH keys automáticamente
# Solo debes forzar Git a usar SSH en vez de HTTPS
git config --global url."git@github.com:".insteadOf "https://github.com/"

echo "✅ SSH configurado correctamente para GitHub."