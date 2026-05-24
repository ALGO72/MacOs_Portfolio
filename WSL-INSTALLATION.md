# 🚀 Guide d'installation dans WSL

## Problème
Vous utilisiez l'extension WSL, mais à chaque lancement du projet dans WSL, il était redirigé vers le répertoire Windows.

## Solution
Nous avons créé des scripts d'automatisation pour copier le projet dans WSL et le configurer correctement.

---

## ✅ Étapes d'installation

### Étape 1: Ouvrir WSL
```bash
wsl bash
```

### Étape 2: Copier le script d'installation
```bash
# Depuis WSL, allez dans le répertoire temporaire
cd /tmp

# Téléchargez ou copiez le script install-wsl.sh
# Si vous avez accès à curl:
curl -fsSL /mnt/c/Users/Frank/Desktop/New/React.Js-Vite/install-wsl.sh -o install-wsl.sh

# Ou copiez-le manuellement
cp /mnt/c/Users/Frank/Desktop/New/React.Js-Vite/install-wsl.sh .
```

### Étape 3: Exécuter le script
```bash
chmod +x install-wsl.sh
./install-wsl.sh
```

---

## 🎯 Ou installation manuelle rapide

Si le script automatisé ne fonctionne pas:

```bash
# 1. Créer les répertoires
mkdir -p ~/projects
cd ~/projects

# 2. Copier le projet depuis Windows
cp -r /mnt/c/Users/Frank/Desktop/New/React.Js-Vite .

# 3. Aller au répertoire
cd React.Js-Vite

# 4. Installer les dépendances
npm install

# 5. Lancer le projet
npm run dev
```

---

## 🎪 Configuration VS Code pour WSL

1. **Installer l'extension WSL** (si pas déjà installée)
   - Allez dans Extensions
   - Recherchez "Remote - WSL"
   - Installez-la

2. **Ouvrir le projet dans WSL**
   - Appuyez sur `Ctrl + Shift + P`
   - Tapez "Remote-WSL: New WSL Window"
   - Ouvrez le dossier: `/home/YOUR_USERNAME/projects/React.Js-Vite`

3. **Configurer le terminal**
   - Dans VS Code, allez à Terminal > New Terminal
   - Vérifiez que vous êtes en WSL (regardez le préfixe du terminal)

---

## 🔄 Synchronisation (Optional)

Si vous modifiez des fichiers dans Windows ET WSL, utilisez:

```bash
# Depuis WSL
rsync -avz /mnt/c/Users/Frank/Desktop/New/React.Js-Vite/ ~/projects/React.Js-Vite/

# Ou depuis Windows (PowerShell)
wsl bash -c "rsync -avz /mnt/c/Users/Frank/Desktop/New/React.Js-Vite/ ~/projects/React.Js-Vite/"
```

---

## 📝 Points importants

- ⚠️ **N'éditez plus le projet uniquement depuis Windows** après l'installation dans WSL
- ✅ Travaillez toujours depuis le répertoire WSL (`~/projects/React.Js-Vite`)
- 🔗 Le répertoire Windows restera comme sauvegarde, mais le développement se fera dans WSL
- 🚀 Les performances seront meilleures avec Vite dans WSL

---

## 🆘 Troubleshooting

### Le projet est redirigé vers Windows
```bash
# Vérifiez que vous êtes dans le bon répertoire
pwd
# Devrait afficher: /home/YOUR_USERNAME/projects/React.Js-Vite
```

### npm install échoue
```bash
# Nettoyez le cache npm
npm cache clean --force

# Réinstallez les dépendances
npm install
```

### Node.js n'est pas installé dans WSL
```bash
# Installez Node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
```

---

## 📚 Commandes utiles

```bash
# Naviguer au projet
cd ~/projects/React.Js-Vite

# Démarrer le développement
npm run dev

# Build pour la production
npm run build

# Linter/Prettier
npm run lint

# Voir la version de Node.js
node --version

# Voir la version de npm
npm --version

# Voir l'espace disque utilisé
du -sh ~/projects/React.Js-Vite
```

---

## ✨ Aliases pratiques

Les aliases suivants seront ajoutés automatiquement:

```bash
# Lancer le projet
react-vite

# Builder le projet
react-build
```

---

Besoin d'aide? Vérifiez que:
1. ✅ WSL est installé et fonctionne
2. ✅ Node.js est installé dans WSL
3. ✅ L'extension WSL est installée dans VS Code
4. ✅ Vous travaillez dans le répertoire WSL, pas Windows
