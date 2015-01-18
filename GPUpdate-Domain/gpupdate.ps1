Get-ADComputer -Filter * | Invoke-Command -ScriptBlock { gpupdate /force } -AsJob
