Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
