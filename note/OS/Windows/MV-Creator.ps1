[String]$VMName = "PS-VM-Test"
[String]$VMPath = "C:\Users\Administrateur\Desktop\Hyper-V\"
[String]$Switch = "NAT"
[String]$SwitchBis = "Serveur"
[UInt64]$DiskSize = 50GB
[UInt64]$RAMSize = 4GB
[Int]$CPU = 2
[String]$ISO = ""

New-VM -name $VMName -MemoryStartupBytes $RAMSize -SwitchName $Switch -NewVHDPath $VMPath+$VMName+".VHDX" -NewVHDSizeBytes $DiskSize -Path $VMPath+$VMName -Version 10.0 -Generation 2 -Confirm:$true

Add-VMNetworkAdapter -VMName $VMName -SwitchName $SwitchBis

Set-VMProcessor –VMName $VMName –count $CPU

Add-VMDvdDrive -VMName $VMName -Path $ISO