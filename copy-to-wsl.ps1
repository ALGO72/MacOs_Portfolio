# Script pour copier le projet vers WSL et configurer les paths
# Ce script résout le problème de redirection vers Windows

$ProjectName = "React.Js-Vite"
$WindowsPath = "c:\Users\Frank\Desktop\New\React.Js-Vite"
$WSLPath = "/home/user/projects/React.Js-Vite"  # Remplacez 'user' par votre nom WSL

Write-Host "=== Copie du projet vers WSL ===" -ForegroundColor Green

# 1. Créer le répertoire dans WSL s'il n'existe pas
Write-Host "Création du répertoire dans WSL..." -ForegroundColor Yellow
wsl bash -c "mkdir -p /home/user/projects"

# 2. Copier tout le contenu
Write-Host "Copie des fichiers..." -ForegroundColor Yellow
wsl bash -c "cp -r /mnt/c/Users/Frank/Desktop/New/React.Js-Vite/* /home/user/projects/React.Js-Vite/ 2>/dev/null || true"

# 3. Créer les répertoires manquants
Write-Host "Création des répertoires de destination..." -ForegroundColor Yellow
wsl bash -c "mkdir -p /home/user/projects/React.Js-Vite/{src,public,node_modules}"

# 4. Synchroniser les fichiers
Write-Host "Synchronisation complète..." -ForegroundColor Yellow
wsl bash -c "rsync -avz --delete /mnt/c/Users/Frank/Desktop/New/React.Js-Vite/ /home/user/projects/React.Js-Vite/"

# 5. Configurer les permissions
Write-Host "Configuration des permissions..." -ForegroundColor Yellow
wsl bash -c "cd /home/user/projects/React.Js-Vite && chmod -R 755 ."

# 6. Créer un .wslconfig pour éviter les problèmes de path
Write-Host "Configuration du environnement WSL..." -ForegroundColor Yellow
wsl bash -c "cd /home/user/projects/React.Js-Vite && export HOME=/home/user && export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

Write-Host "`n=== Configuration terminée ===" -ForegroundColor Green
Write-Host "Votre projet est maintenant dans: $WSLPath" -ForegroundColor Cyan
Write-Host "`nPour accéder au projet dans WSL:" -ForegroundColor Cyan
Write-Host "  wsl bash`n  cd ~/projects/$ProjectName" -ForegroundColor White
Write-Host "`nPour lancer Vite depuis WSL:" -ForegroundColor Cyan
Write-Host "  npm run dev" -ForegroundColor White
