Get-GPOReport -All -ReportType html -Path "C:\GPOReports\AllGPOs.html"
Get-GPOReport -All -ReportType html | Export-Excel -Path "C:\GPOReports\AllGPOs.xlsx"
