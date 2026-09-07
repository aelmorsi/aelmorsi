Connect-ExchangeOnline -UserPrincipalName admin@yourtenant.onmicrosoft.com

Get-EXOMailboxStatistics -Identity "user@domain.com" | Select-Object DisplayName, WhenMailboxCreated

# organization-wide:
Get-EXOMailbox -ResultSize Unlimited | ForEach-Object {
    Get-EXOMailboxStatistics -Identity $_.Identity | Select-Object DisplayName, WhenMailboxCreated
} | Export-Csv "MailboxCreationDates.csv" -NoTypeInformation -Encoding UTF8
