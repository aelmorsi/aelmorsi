Get-ScheduledTask | Where-Object { $_.Author -notlike "Microsoft*" }
