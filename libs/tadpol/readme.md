# Description

Tadpol is a powershell module that used to generate custom *Progress Bars* and *loaders* from a `theme.json` config file

# cmdlets

```Powershell
Get-TPThemes
New-TPObject
Write-TPProgress
```

## Examples
Return all available themes from $moduleroot/themes/bars/*.json 
```powershell
Get-TPThemes
```