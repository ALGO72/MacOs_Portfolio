#!/bin/bash
# Installation complète du projet dans WSL
# Ce script copie le projet depuis Windows et le configure

set -e

echo "╔════════════════════════════════════════════════════════╗"
echo "║  Installation du projet React.Js-Vite dans WSL        ║"
echo "╚════════════════════════════════════════════════════════╝"

# Configuration
WSL_USER=$(whoami)
WSL_HOME="/home/$WSL_USER"
PROJECT_BASE="$WSL_HOME/projects"
PROJECT_DIR="$PROJECT_BASE/React.Js-Vite"
WINDOWS_PATH="/mnt/c/Users/Frank/Desktop/New/React.Js-Vite"

echo ""
echo "📍 Utilisateur WSL: $WSL_USER"
echo "📍 Destination: $PROJECT_DIR"
echo ""

# Créer les répertoires
echo "📁 Création des répertoires..."
mkdir -p "$PROJECT_BASE"
mkdir -p "$PROJECT_DIR"

# Vérifier que le répertoire Windows existe
if [ ! -d "$WINDOWS_PATH" ]; then
    echo "❌ Erreur: Le projet n'existe pas dans Windows à $WINDOWS_PATH"
    exit 1
fi

# Copier les fichiers
echo "📋 Copie des fichiers du projet..."
cp -r "$WINDOWS_PATH"/* "$PROJECT_DIR/" 2>/dev/null || true

# Nettoyer les fichiers inutiles
echo "🧹 Nettoyage..."
rm -rf "$PROJECT_DIR/node_modules" 2>/dev/null || true

# Naviguer au répertoire
cd "$PROJECT_DIR"

# Installer Node.js si nécessaire
if ! command -v node &> /dev/null; then
    echo "📦 Installation de Node.js..."
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Installer les dépendances npm
echo "📦 Installation des dépendances npm..."
npm install

# Configurer les permissions
echo "🔐 Configuration des permissions..."
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;

# Créer un fichier .wslenv pour configurer les variables d'environnement
echo "⚙️  Configuration de l'environnement..."
cat > .env.wsl << EOF
VITE_CWD=$PROJECT_DIR
VITE_ROOT=$PROJECT_DIR
NODE_ENV=development
NODE_PATH=$PROJECT_DIR/node_modules
WSL_ROOT=$PROJECT_DIR
EOF

# Créer un alias utile
echo "🎯 Création des alias..."
if ! grep -q "alias react-vite" ~/.bashrc; then
    cat >> ~/.bashrc << EOF

# Alias pour le projet React.Js-Vite
alias react-vite='cd $PROJECT_DIR && npm run dev'
alias react-build='cd $PROJECT_DIR && npm run build'
EOF
fi

echo ""
echo "╔════════════════════════════════════════════════════════╗"
echo "║  ✅ Installation terminée!                             ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""
echo "📍 Votre projet est maintenant à: $PROJECT_DIR"
echo ""
echo "🚀 Pour lancer le projet:"
echo "   cd $PROJECT_DIR"
echo "   npm run dev"
echo ""
echo "💡 Ou utilisez l'alias (après avoir rechargé .bashrc):"
echo "   react-vite"
echo ""
echo "⚠️  IMPORTANT: N'éditez plus le projet sur Windows!"
echo "   Travaillez uniquement depuis WSL pour éviter les conflits."
echo ""
