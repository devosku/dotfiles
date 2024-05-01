### Install scoop package manager
Write-Host "Installing scoop package manager..." -ForegroundColor "Yellow"
if ($null -eq (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

### AWS CLI
if ($null -eq (Get-Command aws -ErrorAction SilentlyContinue)) {
    Write-Host "Installing AWS CLI..." -ForegroundColor "Yellow"
    Invoke-WebRequest -Uri "https://awscli.amazonaws.com/AWSCLIV2.msi" -Outfile $env:TEMP\AWSCLIV2.msi
    Start-Process /wait msiexec /i C:\temp\AWSCLIV2.msi /quiet
}

Write-Host "Installing fonts..." -ForegroundColor "Yellow"
scoop bucket add nerd-fonts
scoop install nerd-fonts/FiraCode-NF

Write-Host "Installing sudo..." -ForegroundColor "Yellow"
scoop install main/sudo

Write-Host "Installing tools..." -ForegroundColor "Yellow"
scoop install main/curl

Write-Host "Installing programming languages..." -ForegroundColor "Yellow"
scoop install main/nvm
scoop install main/pyenv

Write-Host "Installing starship shell..." -ForegroundColor "Yellow"
scoop install main/starship

Write-Host "Installing latest Node.js LTS with NVM..." -ForegroundColor "Yellow"
nvm install --lts
nvm use --lts

### Node Packages
Write-Host "Installing Node.js Packages..." -ForegroundColor "Yellow"
npm update npm
npm install -g aws-azure-login
npm install -g aws-cdk
npm install -g nodemon

Read-Host "Press ENTER to exit"
