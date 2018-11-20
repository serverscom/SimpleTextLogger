---
external help file: SimpleTextLogger-help.xml
Module Name: SimpleTextLogger
online version:
schema: 2.0.0
---

# Write-SimpleTextLog

## SYNOPSIS
Yet another simplistic function to write logs.

## SYNTAX

```
Write-SimpleTextLog [[-Message] <String>] [-Path] <String> [[-MutexName] <String>]
 [[-LinePrefix] <ScriptBlock>] [[-Separator] <String>] [<CommonParameters>]
```

## DESCRIPTION
Yet another simplistic function to write logs.

## EXAMPLES

### Example 1
```powershell
'EVERYTHING IS OK' | Write-SimpleTextLog -Path 'C:\Logs\CurrentLog.txt'
```

### Example 2
```powershell
Write-SimpleTextLog -Message 'EVERYTHING IS BROKEN' -Path 'C:\Logs\CurrentLog.txt' -MutexName 'MyLogMutex' -LinePrefix {Get-Date -Format 'yyyy-MM-dd HH:mm:ss'} -Separator ';'
```

## PARAMETERS

### -Message
Message you want to write into a log-file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Path
Path to the log-file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MutexName
Name for the mutex object which the function uses to access the log-file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: SimpleTextLoggerLogMutex
Accept pipeline input: False
Accept wildcard characters: False
```

### -LinePrefix
Prefix for each message in the log-file. Since this is a script block, you can use expressions here. 

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: {'[{0}]' -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss.fffffff')}
Accept pipeline input: False
Accept wildcard characters: False
```

### -Separator
Separates `-LinePrefix` from `-Message`.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: "`t"
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

## NOTES

## RELATED LINKS
