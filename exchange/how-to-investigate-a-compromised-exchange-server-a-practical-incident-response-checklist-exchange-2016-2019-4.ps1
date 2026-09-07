Get-TransportRule | Select-Object Name,State,WhenChanged,Description | Sort-Object WhenChanged -Descending
Get-Mailbox -ResultSize Unlimited | Get-InboxRule | Where-Object { $_.ForwardTo -ne $null -or $_.RedirectTo -ne $null }
