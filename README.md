# SimpleTextLogger

This is, yes, yet another PowerShell logging module, a very simple one - it supports only plain text files. It uses mutex to *lock* the log file, but it helps only against other instances of the `Write-SimpleTextLog` function.

The cool things about this particular module are:
1. It is written purely in PowerShell. No C#, no external DLLs.
2. It requires no setup or any kind of supporting infrastructure.
3. It needs only PowerShell 3.0.
4. It supports scriptblocks as log line prefixes. The scriptblock will be executed and the result will be used as a prefix.
5. You can persistently configure the module's parameters with a configuration file (see below)
6. You can pass messages to the log function through the pipeline.

## Exported functions
* [Write-SimpleTextLog](docs/Write-SimpleTextLog.md)

## Module-wide variables
There are several variables defined in the .psm1-file, which are used by the module's functions as default values for parameters:

`[string]$ModuleWideLogMutexName` - default value for **Write-SimpleTextLog**'s `-MutexName` parameter

`[scriptblock]$ModuleWideLinePrefix` - default value for **Write-SimpleTextLog**'s `-LinePrefix` parameter

`[string]$ModuleWideSeparator` - default value for **Write-SimpleTextLog**'s `-Separator` parameter

## Loading variables from an external source
All module-wide variables can be redefined with a `Config.ps1` file, located in the module's root folder. Just put variable definitions in there as you would do with any other PowerShell script. You may find an example of a config file `Config-Example.ps1` in the module's root folder.

## RELATED LINKS
You might want to take a look at other logging approaches for PowerShell:
* [log4ps](https://github.com/gaelcolas/log4ps)
* [Logging](https://github.com/EsOsO/Logging/)
* [OSCCPSLogging](https://github.com/kimoppalfens/OSCCPSLogging)
* [PowerShellLoggingModule](https://github.com/dlwyatt/PowerShellLoggingModule/)
* [PSLogging](https://github.com/9to5IT/PSLogging)