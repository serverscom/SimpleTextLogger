@{
    RootModule           = 'SimpleTextLogger.psm1'
    ModuleVersion        = '1.1.0'
    GUID                 = '42c7e95b-c696-469e-a287-9338cae55129'
    Author               = 'Kirill Nikolaev'
    CompanyName          = 'Fozzy Inc.'
    Copyright            = '(c) 2018 Fozzy Inc. All rights reserved.'
    PowerShellVersion    = '3.0'
    Description          = 'A simple (but with features), pure-PowerShell logger.'
    FunctionsToExport    = @(
        'Write-Log'
    )
    CmdletsToExport      = @()
    AliasesToExport      = @()
    DefaultCommandPrefix = 'SimpleText'
    PrivateData          = @{
        PSData = @{
            Tags         = @()
            LicenseUri   = 'https://github.com/FozzyHosting/SimpleTextLogger/blob/master/LICENSE'
            ProjectUri   = 'https://github.com/FozzyHosting/SimpleTextLogger/'
            ReleaseNotes = ''
        }  
    }
}