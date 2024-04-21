if ($null -ne (Get-Command aws -ErrorAction SilentlyContinue)) {
    # Use autocomplete for AWS command
    Register-ArgumentCompleter -Native -CommandName aws -ScriptBlock {
        param($commandName, $wordToComplete, $cursorPosition)
            $env:COMP_LINE=$wordToComplete
            $env:COMP_POINT=$cursorPosition
            aws_completer.exe | ForEach-Object {
                [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
            }
            Remove-Item Env:\COMP_LINE     
            Remove-Item Env:\COMP_POINT  
    }

    # Change aws profile using AWS_PROFILE env variable
    function Set-AWS-Profile ([string] $profileName)
    {
        $env:AWS_PROFILE = $profileName
    }
}
