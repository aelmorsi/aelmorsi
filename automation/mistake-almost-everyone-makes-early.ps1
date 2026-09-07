$stateFile = "C:\Scripts\state\diskspace-alerted.flag"
if ($diskFreePercent -lt 10) {
    if (-not (Test-Path $stateFile)) {
        Send-AlertEmail -Subject "Low disk space" -Body $msg
        Send-AlertSMS -Message $msg
        New-Item $stateFile -ItemType File -Force | Out-Null
    }
} else {
    Remove-Item $stateFile -ErrorAction SilentlyContinue
}
