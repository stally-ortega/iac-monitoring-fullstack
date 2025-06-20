#!/bin/bash

KEY_PATH="$HOME/.ssh/id_ed25519"

# Si no existe una clave, la generamos
if [ ! -f "$KEY_PATH" ]; then
  echo "🔐 Generando nueva clave SSH..."
  ssh-keygen -t ed25519 -f "$KEY_PATH" -N "" -C "codespace@github.com"
fi

# Inicia el agente si no está corriendo
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)"
fi

# Agrega la clave al agente
ssh-add "$KEY_PATH"

# Muestra la clave pública para que la puedas copiar fácilmente si hace falta
echo "📎 Tu clave pública SSH es:"
cat "${KEY_PATH}.pub"