Get-RoleGroupMember "Organization Management"
Get-ManagementRoleAssignment -RoleAssignee "Organization Management"
Get-EventLog -LogName Security -InstanceId 4728,4732,4756 -After (Get-Date).AddDays(-14)
