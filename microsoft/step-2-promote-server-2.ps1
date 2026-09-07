Install-ADDSDomainController `
    -DomainName "yourdomain.com" `
    -InstallDns:$true `
    -Credential (Get-Credential) `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "YourDSRMPassword123!" -AsPlainText -Force)
