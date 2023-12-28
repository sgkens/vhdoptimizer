
using module ..\tadpol_lib.psm1
using module ..\Get-ColorTune.psm1
Function Get-TPThemes {
    [CmdletBinding()]
    param(
        [Parameter(
            Mandatory = $false,
            #ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 0
        )] [string[]]$type
    )
 
    BEGIN {
        if($null -eq $type -or $type -eq '') { $type = 'all' }
    }
 
    PROCESS {

        switch ($type ){
            'bars' { 
                [console]::write("-----[$(Get-ColorTune -Text "Theme Type" -Color "yellow")] | <Bars>`n")
                (New-Object tadpol).themeBars()  | Format-Table theme,open,close,completed,incomplete,pointer,themepath,example -autosize -Wrap
                    }
            'loaders' { 
                [console]::write("-----[$(Get-ColorTune -Text "Theme Type" -Color "yellow")] | <Loaders>`n")
                (New-Object tadpol).themeloaders() | 
                    select-object @{ Name="Theme"; Expression={"$(Get-ColorTune -Text "$($_.Theme)" -Color "yellow")"}},levels,ThemePath |
                    Format-Table -autosize -Wrap
            }
            'all' { 
                
                [console]::write("-----[$(Get-ColorTune -Text "Theme Type" -Color "yellow")] | <Bars>`n")
                (New-Object tadpol).themeBars()  | Format-Table theme,open,close,completed,incomplete,pointer,themepath,example -autosize -Wrap
                
                [console]::write("-----[$(Get-ColorTune -Text "Theme Type" -Color "yellow")] | <Loaders>`n")
                (New-Object tadpol).themeloaders() | 
                    select-object @{ Name="Theme"; Expression={"$(Get-ColorTune -Text "$($_.Theme)" -Color "yellow")"}},levels,ThemePath |
                    Format-Table -autosize -Wrap
            }
        }     

    }

    END {

    }
}
Export-ModuleMember -Function Get-TPThemes