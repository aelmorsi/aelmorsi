$diskFreePercent = (Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'" |
    Select-Object -ExpandProperty FreeSpace) / (Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'" |
    Select-Object -ExpandProperty Size) * 100

if ($diskFreePercent -lt 10) {
    $msg = "$env:COMPUTERNAME: C: drive at $([math]::Round($diskFreePercent,1))% free"
    Send-AlertEmail -Subject "Low disk space" -Body $msg
    Send-AlertSMS -Message $msg
}
