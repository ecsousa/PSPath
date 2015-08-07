# PSPath

PowerShell module for PATH manipulation. It provides two functions:

* `Update-Path`: Reads PATH from windows registry and updates current PATH
  environment variable
* `Add-Path`: Adds a path to windows registry, and then calls `Update-Path`.
  `-System` switch will add to system PATH rather than user.

## Installing

Windows 10 users:

    Install-Module PSPath -Scope CurrentUser
  
Or you can install it manually coping `PSPath.psm1` to your modules folder (e.g.
` $Env:USERPROFILE\Eduardo_Sousa\Documents\WindowsPowerShell\Modules\PSPath\`)
