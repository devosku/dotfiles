Push-Location (Join-Path (Split-Path -parent $profile) "components")

# From within the ./components directory...
. .\aws.ps1
. .\starship.ps1

Pop-Location