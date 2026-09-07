$users = Get-MgUser -All -Property Id, DisplayName, UserPrincipalName

$report = foreach ($user in $users) {
    $methods = Get-MgUserAuthenticationMethod -UserId $user.Id
    $methodTypes = $methods | ForEach-Object { $_.AdditionalProperties["@odata.type"] -replace "#microsoft.graph.", "" }

    [PSCustomObject]@{
        DisplayName       = $user.DisplayName
        UserPrincipalName = $user.UserPrincipalName
        MFARegistered     = ($methodTypes | Where-Object { $_ -ne "passwordAuthenticationMethod" }).Count -gt 0
        RegisteredMethods = ($methodTypes -join ", ")
    }
}

$report | Export-Csv "MFAStatusReport.csv" -NoTypeInformation -Encoding UTF8
