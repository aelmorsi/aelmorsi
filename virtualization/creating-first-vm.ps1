New-VM -Name "TestVM01" -MemoryStartupBytes 4GB -Generation 2 `
    -NewVHDPath "D:\VMs\TestVM01\TestVM01.vhdx" -NewVHDSizeBytes 60GB `
    -SwitchName "External Switch"

Set-VMProcessor -VMName "TestVM01" -Count 2
Set-VMDvdDrive -VMName "TestVM01" -Path "D:\ISOs\WindowsServer.iso"

Start-VM -Name "TestVM01"
