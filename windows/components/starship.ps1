if ($null -ne (Get-Command starship -ErrorAction SilentlyContinue)) {
    # Use starship on Windows Terminal to prettify the shell
    if ($null -ne $Env:WT_SESSION) {
        Invoke-Expression (&starship init powershell)
    }
}