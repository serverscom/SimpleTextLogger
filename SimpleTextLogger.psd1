@{
    RootModule           = 'SimpleTextLogger.psm1'
    ModuleVersion        = '1.1.0'
    GUID                 = '42c7e95b-c696-469e-a287-9338cae55129'
    Author               = 'Kirill Nikolaev'
    CompanyName          = 'Fozzy Inc.'
    Copyright            = '(c) 2018 Fozzy Inc. All rights reserved.'
    PowerShellVersion    = '3.0'
    FunctionsToExport    = @(
        'Write-Log'
    )
    CmdletsToExport      = @()
    AliasesToExport      = @()
    DefaultCommandPrefix = 'SimpleText'
}