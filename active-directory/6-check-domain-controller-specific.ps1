Get-EventLog -LogName Security -InstanceId 4624 -After (Get-Date).AddDays(-3) |
  Where-Object { $_.Message -match "Logon Type:\s*3" -and $_.Message -match "Account Name:.*\$" }
