Get-ChildItem Cert:\LocalMachine\My | Where-Object { $_.Issuer -like "*Let's Encrypt*" -or $_.Issuer -like "*R3*" -or $_.Issuer -like "*E1*" } |
    Select-Object Subject, Thumbprint, NotAfter
