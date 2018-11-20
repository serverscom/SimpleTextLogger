function Write-Log {
    #Requires -Version 3.0

    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipeline)]
        [string]$Message,
        [Parameter(Mandatory)]
        [string]$Path,
        [string]$MutexName = $ModuleWideLogMutexName,
        [scriptblock]$LinePrefix = $ModuleWideLinePrefix,
        [string]$Separator = $ModuleWideSeparator
    )
 
    BEGIN {
        $ErrorActionPreference = 'Stop'
 
        Write-Debug -Message ('ENTER {0}' -f $MyInvocation.MyCommand.Name)
    }
    PROCESS {
        try {
            Write-Debug -Message ('ENTER TRY {0}' -f $MyInvocation.MyCommand.Name)

            Write-Debug -Message ('$Message = ''{0}''' -f $Message)
            Write-Debug -Message ('$Path = ''{0}''' -f $Path)
            Write-Debug -Message ('$MutexName = ''{0}''' -f $MutexName)
            Write-Debug -Message ('$LinePrefix = ''{0}''' -f $LinePrefix)
            Write-Debug -Message ('$Separator = ''{0}''' -f $Separator)

            Write-Debug -Message '$GotMutex = $false'
            $GotMutex = $false
            Write-Debug -Message ('$GotMutex: ''{0}''' -f [string]$GotMutex)
            Write-Debug -Message ('$Mutex = New-Object -TypeName ''System.Threading.Mutex'' -ArgumentList ($true, ''{0}'', [ref]$GotMutex)' -f $MutexName)
            $Mutex = New-Object -TypeName 'System.Threading.Mutex' -ArgumentList ($true, $MutexName, [ref]$GotMutex)
            Write-Debug -Message ('$Mutex: ''{0}''' -f $Mutex)
            Write-Debug -Message ('$GotMutex: ''{0}''' -f [string]$GotMutex)
            Write-Debug -Message 'if (-not $GotMutex)'
            if (-not $GotMutex) {
                Write-Debug -Message '$null = $Mutex.WaitOne()'
                $null = $Mutex.WaitOne()
                Write-Debug -Message ('$GotMutex: ''{0}''' -f [string]$GotMutex)
            }

            Write-Debug -Message '$LinePrefixResult = [string]($LinePrefix.Invoke())'
            $LinePrefixResult = [string]($LinePrefix.Invoke())
            Write-Debug -Message ('$LinePrefixResult = ''{0}''' -f $LinePrefixResult)
            Write-Debug -Message ('$Message = ''{{0}}{{1}}{{2}}'' -f ''{0}'', ''{1}'', ''{2}''' -f $LinePrefixResult, $Separator, $Message)
            $Message = '{0}{1}{2}' -f $LinePrefixResult, $Separator, $Message
            Write-Debug -Message ('$Message = ''{0}''' -f $Message)
            Write-Debug -Message ('$null = Add-Content -Path ''{0}'' -Value ''{1}''' -f $Path, $Message)
            $null = Add-Content -Path $Path -Value $Message

            Write-Debug -Message '$Mutex.ReleaseMutex()'
            $Mutex.ReleaseMutex()
            Write-Debug -Message '$Mutex.Close()'
            $Mutex.Close()

            Write-Debug -Message ('EXIT TRY {0}' -f $MyInvocation.MyCommand.Name)
        }
        catch {
            Write-Debug -Message ('ENTER CATCH {0}' -f $MyInvocation.MyCommand.Name)

            $PSCmdlet.ThrowTerminatingError($_)

            Write-Debug -Message ('EXIT CATCH {0}' -f $MyInvocation.MyCommand.Name)
        }
    }
    END {
        Write-Debug -Message ('EXIT {0}' -f $MyInvocation.MyCommand.Name)
    }
}