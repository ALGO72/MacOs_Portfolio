# Script d'installation rapide pour WSL depuis Windows
# Exécutez ceci dans PowerShell en tant qu'administrateur

Write-Host "`n╔════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  Installation du projet React dans WSL              ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

# Configuration
$SourcePath = "c:\Users\Frank\Desktop\New\React.Js-Vite"
$WSLDistro = "Ubuntu"  # Changez si vous utilisez une autre distro
$WSLUser = "user"      # À adapter avec votre nom d'utilisateur WSL

# Vérifier que WSL est installé
Write-Host "🔍 Vérification de WSL..." -ForegroundColor Yellow
$WSLCheck = wsl --list 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ WSL n'est pas installé. Installez WSL d'abord." -ForegroundColor Red
    exit 1
}
Write-Host "✅ WSL détecté`n" -ForegroundColor Green

# Afficher les distros disponibles
Write-Host "📋 Distributions WSL disponibles:" -ForegroundColor Yellow
wsl --list

Write-Host ""
Write-Host "💡 Quelle distro utiliser? (par défaut: Ubuntu)" -ForegroundColor Cyan
$UserDistro = Read-Host "Appuyez sur Entrée pour Ubuntu ou tapez le nom de votre distro"
if ($UserDistro) { $WSLDistro = $UserDistro }

Write-Host ""
Write-Host "💡 Quel est votre nom d'utilisateur WSL?" -ForegroundColor Cyan
$UserWSLUser = Read-Host "Appuyez sur Entrée pour 'user' ou tapez votre nom"
if ($UserWSLUser) { $WSLUser = $UserWSLUser }

# Étape 1: Créer les répertoires
Write-Host "`n📁 Création des répertoires..." -ForegroundColor Yellow
wsl -d $WSLDistro bash -c "mkdir -p /home/$WSLUser/projects"

# Étape 2: Copier les fichiers
Write-Host "📋 Copie des fichiers du projet..." -ForegroundColor Yellow
wsl -d $WSLDistro bash -c "cp -r /mnt/c/Users/Frank/Desktop/New/React.Js-Vite /home/$WSLUser/projects/ && echo '✅ Copie réussie'"

# Étape 3: Installer les dépendances
Write-Host "📦 Installation des dépendances npm..." -ForegroundColor Yellow
wsl -d $WSLDistro bash -c "cd /home/$WSLUser/projects/React.Js-Vite && npm install"

# Étape 4: Succès
Write-Host "`n╔════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║  ✅ Installation terminée!                             ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════╝`n" -ForegroundColor Green

Write-Host "🚀 Prochaines étapes:" -ForegroundColor Cyan
Write-Host "1. Ouvrez WSL:"
Write-Host "   wsl -d $WSLDistro`n" -ForegroundColor White

Write-Host "2. Allez au projet:"
Write-Host "   cd /home/$WSLUser/projects/React.Js-Vite`n" -ForegroundColor White

Write-Host "3. Lancez Vite:"
Write-Host "   npm run dev`n" -ForegroundColor White

Write-Host "4. Ou ouvrez dans VS Code WSL:"
Write-Host "   code ." -ForegroundColor White
Write-Host "   (Utilisez l'extension 'Remote - WSL')`n"

Write-Host "⚠️  IMPORTANT:" -ForegroundColor Yellow
Write-Host "   Travaillez dorénavant dans WSL, pas dans Windows!`n" -ForegroundColor Yellow
