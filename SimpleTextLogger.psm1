#Requires -Version 3.0

$ModulePath = $PSScriptRoot
$ModuleName = ($MyInvocation.MyCommand.Name).Substring(0, ($MyInvocation.MyCommand.Name).Length - 5)

[string]$ModuleWideLogMutexName = '{0}LogMutex' -f $ModuleName
[scriptblock]$ModuleWideLinePrefix = {'[{0}]' -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss.fffffff')}
[string]$ModuleWideSeparator = "`t"

foreach ($FunctionType in @('Private', 'Public')) {
    $Path = Join-Path -Path $ModulePath -ChildPath ('{0}\*.ps1' -f $FunctionType)
    if (Test-Path -Path $Path) {
        Get-ChildItem -Path $Path | ForEach-Object -Process {. $_.FullName}
    }
}

$Path = Join-Path -Path $ModulePath -ChildPath 'Config.ps1'
if (Test-Path -Path $Path -PathType Leaf) {
    . $Path
}