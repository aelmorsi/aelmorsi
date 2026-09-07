Get-EXOMailbox -ResultSize Unlimited -Properties EmailAddresses |
    Select-Object DisplayName, @{Name="Aliases";Expression={($_.EmailAddresses | Where-Object {$_ -clike "smtp:*"}) -join "; "}}
