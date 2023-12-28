using module colortune\Get-ColorTune.psm1
using module cfbytes\cfbytes-class.psm1
New-Alias -Name gct -Value Get-ColorTune -Scope local
# if(Get-module -ListAvailable -Name Hyper-V) {
#     Import-Module Hyper-V
# }else {
#     [console]::writeline("$(gct -text "Hyper-V module not found." -color red) Please install the Hyper-V module and try again.")
#     exit
# }


function Get-vhdmetadata(){
    param(
        [string]$VHDPath
    )
    try {
        [console]::writeline("$(gct -text "Optimizer: " -color gray) └≡ Fetching metadata...")
        $VHDInfo = Get-VHD -Path $VHDPath | 
            select-object -Property Path, vhdtype, size
    }
    catch [system.exception] {
        [console]::writeline("$(gct -text "Optimizer: " -color red) └≡ [ERROR] $($_.Exception.Message)")
        exit
    }
    return $VHDInfo
}


function New-VHDOptimizer(){
    [cmdletbinding()]
    param (
        [string[]]$VHDPaths
    )
    
    $optimization = @()
    [console]::WriteLine("$(gct -text "Optimizer: " -color cyan)▓▒░ virtual hard disk optimization started ░▒▓")
    
    foreach ($VHDPath in $VHDPaths) {
        $Name = $VHDPath | Split-Path -Leaf
        [console]::WriteLine("$(gct -text "Optimizer: " -color cyan) └≡ Optimize ═» $(gct -text $VHDPath -color yellow) ")
        try {
            [console]::WriteLine("$(gct -text "Optimizer: " -color cyan) └≡ Calculate Size ═» $(gct -text $name -color yellow)")
            
            $meta_before = Get-vhdmetadata -VHDPath $VHDPath
            
            [console]::WriteLine("$(gct -text "Optimizer: " -color cyan) └≡ Compact ═» $(gct -text $name -color yellow)")
            
            # Compact the virtual hard disk
           # Optimize-VHD -Path $VHDPath -Mode Full

            $meta_after = Get-vhdmetadata -VHDPath $VHDPath
            $optimization += @{
                Path      = $meta_before.Path
                vhdtype   = $meta_before.vhdtype
                size      = [cfbytes]::ConvertAuto($meta_after.size)
                reclaimed = [cfbytes]::ConvertAuto(($meta_before.size - $meta_after.size))
            }
            $optimization | Format-Table -AutoSize
            [console]::WriteLine("$(gct -text "Optimizer: " -color cyan) └≡ Optimization completed successfully.")
        } catch {
            [console]::WriteLine("$(gct -text "Optimizer: " -color cyan) $(gct -text "Error optimizing virtual hard disk at:$VHDPath" -color blue)")
            [console]::WriteLine("$(gct -text "Optimizer: " -color cyan) $(gct -text "Error Message: $_ " -color cyan)")
        }
    }
    $optimization 
    $before_optimization | Format-Table -AutoSize
    $after_optimization | Format-Table -AutoSize
    [console]::WriteLine("$(gct -text "Optimizer: " -color cyan) virtual hard disk optimization completed.")
}
Export-ModuleMember -Function New-VHDOptimizer
