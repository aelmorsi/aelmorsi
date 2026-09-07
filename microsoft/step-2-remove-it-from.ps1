Get-WebBinding | Where-Object { $_.certificateHash -eq "" }
Remove-WebBinding -Name "Default Web Site" -Protocol https -Port 443
