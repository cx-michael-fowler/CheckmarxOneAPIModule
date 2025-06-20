@{
    # Script module or binary module file associated with this manifest.
    RootModule = 'CxOneAPIModule.psm1'

    # Version number of this module.
    ModuleVersion = '7.3'

    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID = '02be0597-0a30-42f2-9a78-1c8504cae246'

    # Author of this module
    Author = 'Michael Fowler'

    # Company or vendor of this module
    CompanyName = 'Checkmarx'

    # Copyright statement for this module
    Copyright = '(c) 2025 Checkmarx Ltd. All rights reserved.'

    # Description of the functionality provided by this module
    Description = 'Simplify common tasks when scritpting for Checkmarx One'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.1'
    
    # Assemblies that must be loaded prior to importing this module
    RequiredAssemblies = @(
                            'System.Web.Extensions.dll',
                            'System.Windows.Forms.dll',
                            'System.Drawing.dll'
                          )

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @( 
                           'ApiCall', 
                           'New-Connection', 
                           'New-SilentConnection', 
                           'Get-AllProjects', 
                           'Get-ProjectsByNames', 
                           'Get-ProjectsByIds',
                           'Get-Applications', 
                           'Get-AllScans',
                           'Get-AllScansByDays',
                           'Get-ScansByIds',
                           'Get-LastScans', 
                           'Get-LastScansForGivenBranches', 
                           'Get-ScanResults',
                           'Get-SeverityCounters'
                         )

    # HelpInfo URI of this module
    # HelpInfoURI = 'https://github.com/cx-michael-fowler/CheckmarxOneAPIModule'
}

