# Paths
[String]$VMName = "PS-VM-Test"
[String]$VMPath = "C:\Users\Administrateur\Desktop\Hyper-V\"
[String]$VHDPath = $VMPath + $VMName + "\" + $VMName + ".VHDX"
[String]$VMPathName = $VMPath + $VMName

# Set VM configuration
[String[]]$Switch = "NAT","Serveurs"
[UInt64]$DiskSize = 50GB
[UInt64]$RAMSize = 4GB

New-VM -name $VMName -MemoryStartupBytes $RAMSize -NewVHDPath $VHDPath -NewVHDSizeBytes $DiskSize -Path $VMPathName -Version 10.0 -Generation 2 -Confirm:$true

# NetWork Adapter
foreach ($SwitchBis in $Switch) {
    Add-VMNetworkAdapter -VMName $VMName -SwitchName $SwitchBis
}

# CPU
[Int]$CPU = 2
Set-VMProcessor –VMName $VMName –count $CPU

# ISO
[String]$ISO = "C:\Users\Administrateur\Desktop\ISO\20348.169.210806-2348.fe_release_svc_refresh_SERVER_EVAL_x64FRE_fr-fr.iso"
Add-VMDvdDrive -VMName $VMName -Path $ISO

# Boot order
$dvd = Get-VMDvdDrive -VMName $VMName
Set-VMFirmware -VMName $VMName -FirstBootDevice $dvd

# Dynamic RAM
Set-VMMemory $VMName -DynamicMemoryEnabled $true

# Start VM
Start-VM -VMName $VMName

# Start auto
Start-VM -VMName "PS-VM-Test"
Start-Sleep -Seconds 1
vmconnect $env:COMPUTERNAME $VMName