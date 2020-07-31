#Requires -Version 7

$Module = 'PSTemperature'

# everything in ModuleSource will be copied to output folder
$ModuleSource = Join-Path -Path $PSScriptRoot -ChildPath $Module -AdditionalChildPath '*'

# dotnet build will be executed against the project in ModuleDotNetSource
$ModuleDotNetSource = Join-Path -Path $PSScriptRoot -ChildPath 'src'

# set the base output folder
$OutputBaseFolder = Join-Path -Path $PSScriptRoot -ChildPath 'Output'

# set the folder where the usable module will be built
$OutputModule = Join-Path -Path $OutputBaseFolder -ChildPath $Module

# set the sub-folder for the assemblies (dlls and other files) generated by dotnet build
$OutputBin = Join-Path -Path $OutputModule -ChildPath 'bin'

# build the assemblies from the C# code and save to the output bin folder
dotnet build $ModuleDotNetSource -o $OutputBin

# copy the PowerShell-centric files for the module to the output folder
Copy-Item $ModuleSource $OutputModule -Recurse -Force