# Paths
[String]$VMName = "PS-VM-Test"
[String]$VMPath = "C:\Users\Administrateur\Desktop\Hyper-V\"
[String]$VHDPath = $VMPath + $VMName + "\" + $VMName + ".VHDX"
[String]$VMPathName = $VMPath + $VMName
[String]$ISO = "C:\Users\Administrateur\Desktop\ISO\20348.169.210806-2348.fe_release_svc_refresh_SERVER_EVAL_x64FRE_fr-fr.iso"
# Set VM configuration
[String[]]$Switch = "NAT","Serveurs"
[UInt64]$DiskSize = 50GB
[UInt64]$RAMSize = 4GB
[Int]$CPU = 2
# Boot order
$network = Get-VMNetworkAdapter -VMName $VMName
$vhd = Get-VMHardDiskDrive -VMName $VMName
$dvd = Get-VMDvdDrive -VMName $VMName

New-VM -name $VMName -MemoryStartupBytes $RAMSize -NewVHDPath $VHDPath -NewVHDSizeBytes $DiskSize -Path $VMPathName -Version 10.0 -Generation 2 -Confirm:$true
# -SwitchName $Switch
# -BootDevice "CD"

foreach ($SwitchBis in $Switch) {
    Add-VMNetworkAdapter -VMName $VMName -SwitchName $SwitchBis
}

Set-VMProcessor –VMName $VMName –count $CPU

Add-VMDvdDrive -VMName $VMName -Path $ISO

Set-VMFirmware -VMName $name -BootOrder $dvd,$network,$vhd