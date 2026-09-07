New-ADUser -Name "Test User" -SamAccountName test.user -AccountPassword (ConvertTo-SecureString "P@ssw0rd123" -AsPlainText -Force) -Enabled $true -Path "OU=Users,DC=corp,DC=local"
