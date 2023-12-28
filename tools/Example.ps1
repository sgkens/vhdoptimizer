Using Module ..\libs\optimize-vhdwrapper.psm1
# Example usage:
$VHDPaths = @(
    "E:\freenas_vdisks\fn_2TB_9788CC5C-rplv3.vhdx", 
    "M:\freenas_vdisks\fn_disk_2TB_3F37781F3558.vhdx",
    "I:\freenas_vdisks\fn_disk_2TB_01_2DDAEEE94BC0.vhdx",
    "G:\freenas_vdisks\fn_disk_2TB_04_P2_RPL03_AA439F84A276.vhdx",
    "L:\freenas_vdisks\fn_disk_2TB_02_EE4E7241ECDB.vhdx",
    "I:\freenas_vdisks\fn_disk_910GB_01_98B3C4278EBA.vhdx",
    "L:\freenas_vdisks\fn_disk_910GB_02_6306D9124C9B.vhdx",
    "D:\freenas_vdisks\fn_disk_920GB_01_BA8653549329.vhdx",
    "H:\freenas_vdisks\fn_disk_920GB_03_7AB0C0645F1A.vhdx",
    "J:\freenas_vdisks\fn_disk_920GB_04_12E33F1E3DAB.vhdx",
    "L:\freenas_vdisks\fn_disk_920GB_01_P2_44CABD67AAEC.vhdx",
    "I:\freenas_vdisks\fn_disk_920GB_02_P2_9DD6A9E0A8A8.vhdx",
    "F:\freenas_vdisks\fn_disk_920GB_02_5C8E649D58A7.vhdx",
    "G:\freenas_vdisks\fn_disk_920GB_03_P2_3560D5309814.vhdx"
)
New-VHDOptimizer -VHDPaths $VHDPaths
