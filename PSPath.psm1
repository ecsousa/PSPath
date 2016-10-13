
function Update-Path {

    $configuredPaths = [string[]] (& {
        foreach($path in & {
            (Get-ItemProperty 'HKLM:\System\CurrentControlSet\Control\Session Manager\Environment').PATH;
            (Get-ItemProperty 'HKCU:\Environment').PATH;
        }) {
            if($path) {
                $path.Split(';') | % { if($_) { $_ } }
            }
        }
    })

    $currentPaths = $env:Path.Split(';')

    $newPaths = [string[]] $configuredPaths | ? { -not ($currentPaths -contains $_) }

    foreach($path in $newPaths) {
        Write-Warning "$path added to current PATH environment."
        $env:Path = $env:Path + ';' + $path
    }

}

function Add-Path {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)] [string] $path,
        [switch] $System
        );

    if($System) {
        $regPath = 'HKLM:\System\CurrentControlSet\Control\Session Manager\Environment';
    }
    else {
        $regPath = 'HKCU:\Environment';
    }
    
    # Need to preserve the DOS style environmental variables like %USERPROFILE% because PATH is stored in the registry as an ExpandString.  
    # Otherwise when read, appended, and set the env vars will have been expanded and the original values lost. 
    # The '$false' is the DefaultValue, which is what what would be returned if the property 'PATH' does not exist.
    $currentPath = (Get-Item -Path $regPath).GetValue('Path', $false, [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)

    if($currentPath) {
        $newPath = "$currentPath;$path";
    }
    else {
        $newPath = $path
    }

    Set-ItemProperty -Path $regPath -Name PATH -Value $newPath

    Update-Path
}

