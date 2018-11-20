# Rename this file to "Config.ps1" to load variables, defined here, into the module.

#Requires -Version 3.0

[string]$ModuleWideLogMutexName = '{0}LogMutex' -f $ModuleName
[scriptblock]$ModuleWideLinePrefix = {'[{0}]' -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss.fffffff')}
[string]$ModuleWideSeparator = "`t"