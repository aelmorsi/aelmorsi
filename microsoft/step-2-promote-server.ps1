Install-ADDSForest `
    -DomainName "yourdomain.com" `
    -DomainNetbiosName "YOURDOMAIN" `
    -ForestMode "WinThreshold" `
    -DomainMode "WinThreshold" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "YourDSRMPassword123!" -AsPlainText -Force)
