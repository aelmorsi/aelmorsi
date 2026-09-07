Install-Module Microsoft.Graph.Users -Scope CurrentUser
Install-Module Microsoft.Graph.Identity.SignIns -Scope CurrentUser

Connect-MgGraph -Scopes "UserAuthenticationMethod.Read.All", "AuditLog.Read.All", "User.Read.All"
