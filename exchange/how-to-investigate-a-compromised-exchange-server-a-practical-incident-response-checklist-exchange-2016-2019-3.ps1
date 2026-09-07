Get-MailboxExportRequest
Get-MailboxPermission -Identity * | Where-Object { $_.User -notlike "NT AUTHORITY\SELF" -and $_.IsInherited -eq $false }
Get-Mailbox | Get-MailboxPermission | Where-Object { $_.AccessRights -like "*FullAccess*" -and $_.User -notlike "NT AUTHORITY*" }
