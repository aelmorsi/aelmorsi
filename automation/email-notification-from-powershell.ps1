function Send-AlertEmail {
    param(
        [string]$Subject,
        [string]$Body,
        [string]$To = "oncall@yourcompany.com"
    )
    $params = @{
        From       = "monitoring@yourcompany.com"
        To         = $To
        Subject    = "[ALERT] $Subject"
        Body       = $Body
        SmtpServer = "smtp.yourcompany.com"
        Port       = 587
        UseSsl     = $true
        Credential = (Import-Clixml "C:\Scripts\smtp-cred.xml")
    }
    Send-MailMessage @params
}
