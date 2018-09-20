[DscLocalConfigurationManager()]
Configuration LCM {

    node localhost {
        Settings 
        { 
            ConfigurationMode = 'ApplyAndAutoCorrect'
            RebootNodeIfNeeded = $false
            ActionAfterReboot = 'ContinueConfiguration'
            ConfigurationModeFrequencyMins = 15;
        }

    }
}

md c:\lcmconfig -ErrorAction SilentlyContinue
lcm -OutputPath c:\lcmconfig
Set-DscLocalConfigurationManager -Path c:\lcmconfig -Force -Verbose