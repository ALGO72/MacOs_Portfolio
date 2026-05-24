#!/bin/bash
# Configuration du projet dans WSL pour éviter les redirections

WSL_USER=$(whoami)
PROJECT_DIR="/home/$WSL_USER/projects/React.Js-Vite"
echo "=== Configuration du projet React.Js-Vite dans WSL ==="

# Aller au répertoire du projet
cd "$PROJECT_DIR" || exit 1

# Installer les dépendances Node si nécessaire
if [ ! -d "node_modules" ]; then
    echo "Installation des dépendances npm..."
    npm install
fi

# Créer un fichier .env pour éviter les chemins Windows
echo "Création de la configuration locale..."
cat > .env.local << EOF
VITE_CWD=$PROJECT_DIR
NODE_ENV=development
EOF

# Configurer les permissions
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;

echo "✓ Configuration terminée!"
echo ""
echo "Vous pouvez maintenant lancer le projet:"
echo "  cd $PROJECT_DIR"
echo "  npm run dev"
echo ""
echo "Le projet restera dans WSL et ne sera pas redirigé vers Windows."
