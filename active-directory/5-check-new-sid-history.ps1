Get-ADUser -Filter * -Properties SIDHistory | Where-Object { $_.SIDHistory -ne $null } | Select-Object Name,SIDHistory
