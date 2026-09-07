Get-ADDomainController -Filter * | Select-Object Name, OperatingSystem, Site
dcdiag /v
repadmin /replsummary
