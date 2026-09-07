function Send-AlertSMS {
    param([string]$Message)
    # Example gateway addresses - confirm current ones with the carrier,
    # these do change:
    # AT&T:      number@txt.att.net
    # T-Mobile:  number@tmomail.net
    # Verizon:   number@vtext.com
    Send-MailMessage -From "monitoring@yourcompany.com" -To "5555551234@vtext.com" `
        -Subject "" -Body $Message -SmtpServer "smtp.yourcompany.com" -Port 587 -UseSsl
}
