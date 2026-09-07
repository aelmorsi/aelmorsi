# On-premises Exchange Management Shell:
Get-Mailbox -Identity "user@domain.com"          # still on-premises
Get-RemoteMailbox -Identity "user@domain.com"    # already migrated to Exchange Online
