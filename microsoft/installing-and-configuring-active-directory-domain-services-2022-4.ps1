Install-ADDSForest -DomainName "corp.local" -DomainNetbiosName "CORP" `
  -SafeModeAdministratorPassword (ConvertTo-SecureString "StrongP@ssw0rd!" `
-AsPlainText -Force) -InstallDns -Force
