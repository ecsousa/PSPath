@{
RootModule = 'PSPath.psm1'
ModuleVersion = '1.0.1'
GUID = '43d1ccde-b82b-4b4b-8ad3-386bf707e94b'
Author = 'Eduardo Antunes C. de Sousa'
Description = 'Path Environment Manipuation Functions'
PowerShellVersion = '3.0'
DotNetFrameworkVersion = '4.0'
CLRVersion = '4.0'
FunctionsToExport = 'Update-Path', 'Add-Path'
HelpInfoURI = 'https://github.com/ecsousa/PSPath'
PrivateData = @{
        Tags='Path'
        ProjectUri='https://github.com/ecsousa/PSPath'
        ReleaseNotes = 'Respect the environmental variables in the Path as stored in the registry as a ExpandString.'
    }
}
