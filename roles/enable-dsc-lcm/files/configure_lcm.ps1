[DscLocalConfigurationManager()]
Configuration LCM {

    node localhost {
        Settings 
        { 
            ConfigurationMode = 'ApplyAndAutoCorrect'
            RebootNodeIfNeeded = $false
            ActionAfterReboot = 'ContinueConfiguration'
            ConfigurationModeFrequencyMins = 5;
        }

    }
}

md c:\lcmconfig
lcm -OutputPath c:\lcmconfig
Set-DscLocalConfigurationManager -Path c:\lcmconfig -Force -Verbose