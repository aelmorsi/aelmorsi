Get-EXOMailbox -ResultSize Unlimited -Properties EmailAddresses |
    Select-Object DisplayName, PrimarySmtpAddress,
    @{Name="AllSmtpAddresses";Expression={($_.EmailAddresses | Where-Object {$_ -like "smtp:*" -or $_ -like "SMTP:*"}) -join "; "}} |
    Export-Csv "AllSmtpAddresses.csv" -NoTypeInformation -Encoding UTF8
