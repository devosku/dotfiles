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

# fonts
Write-Host "Installing fonts..." -ForegroundColor "Yellow"
scoop bucket add nerd-fonts
scoop install nerd-fonts/FiraCode-NF

# system and cli
Write-Host "Installing tools..." -ForegroundColor "Yellow"
scoop install main/curl

Write-Host "Installing programming languages..." -ForegroundColor "Yellow"
scoop install main/nvm
scoop install main/pyenv

Write-Host "Installing starship shell..." -ForegroundColor "Yellow"
scoop install main/starship

# following git installation with choco is disabled but kept for reference:
# git credential manager is disabled because aws codecommit fights with it
# choco install git.install         --limit-output -params '"/GitAndUnixToolsOnPath /NoShellIntegration /NoCredentialManager"'
# choco install poshgit             --limit-output

# Set git ssh-agent to start automatically
# Get-Service ssh-agent | Set-Service -StartupType Automatic -PassThru | Start-Service

Update-Environment


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
