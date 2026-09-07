Get-EventLog -LogName Security -InstanceId 4769 -After (Get-Date).AddDays(-7) |
  Where-Object { $_.Message -match "0x17|0x1F" }
