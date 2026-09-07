Get-ChildItem "C:\inetpub\logs\LogFiles\W3SVC1" | Sort-Object LastWriteTime -Descending | Select-Object -First 5
Select-String -Path "C:\inetpub\logs\LogFiles\W3SVC1\*.log" -Pattern "autodiscover.json","X-AnonResource","X-BEResource" | Select-Object -First 50
