Get-ScheduledTask | Where-Object { $_.TaskName -like "*win-acme*" -or $_.TaskName -like "*wacs*" }
