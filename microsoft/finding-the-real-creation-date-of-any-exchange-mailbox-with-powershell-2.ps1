Get-Mailbox -ResultSize Unlimited | ForEach-Object {
    Get-MailboxStatistics -Identity $_.Identity | Select-Object DisplayName, WhenMailboxCreated
} | Export-Csv "C:\Reports\MailboxCreationDates.csv" -NoTypeInformation -Encoding UTF8
