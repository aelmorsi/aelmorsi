Get-GPO -All | Sort-Object ModificationTime -Descending | Select-Object DisplayName,ModificationTime,Owner | Select-Object -First 20
