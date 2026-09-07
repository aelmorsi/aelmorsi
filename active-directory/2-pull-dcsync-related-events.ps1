Get-EventLog -LogName Security -InstanceId 4662 -After (Get-Date).AddDays(-7) |
  Where-Object { $_.Message -match "1131f6aa-9c07-11d1-f79f-00c04fc2dcd2" }
