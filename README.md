This module has been created to simplify common tasks when scritpting for Checkmarx One
   
The following functions are available for this module
    
    ApiCall
        Details
            Function to take an Invoke-WebRequest or Invoke-RestMethod script block
            Will recreate authorisation token if due to expire
            Performs error handling
        Parameters
            ScriptBlock - Script block to run. Must be Invoke-WebRequest or Invoke-RestMethod
            CxOneConnObj - a Checkmarx One connection object
            noerror - switch to ignore error hanlder and rethrow the error
        Examplle 
            $response = ApiCall { Invoke-WebRequest $uri -Method GET -Headers $conn.Headers } $conn
    
    New-Connection
        Details
            Function to create a Checkmarx Connection object with a prompt for the API Key
            Connection object is needed for additional calls in module
            Connection object contains the BaseURI and Authorisation Headers
        Parameters
            No Parameters required
        Example 
            $conn = New-Connection
    
    New-SilentConnection
        Details
            Function to create a Checkmarx Connection object with a provided API Key
            Connection object is needed for additional calls in modeule
            Connection object contains the BaseURI and Authorisation Headers
        Parameters
            apikey - Checkmarx One API key
        Example
            $conn = New-SilentConnection "<API_KEY>"
        
    Get-AllProjects
        Details
            Function to return a list of all projects
            Returns a List of project objects
        Parameters
            CxOneConnObj - Checkmarx One connection object
            getBranches - Optional switch to determine if project branches should be returned for the projects
        Example
            $projects = Get-AllProjects $conn
    
    Get-ProjectsByNames
        Details 
            Function to get a list of projects filtered by CSV string of project names
        Parameters
            CxOneConnObj - Checkmarx One connection object
            projectNames - CSV string of project names to filter results returned
            getBranches - Optional switch to determine if project branches should be returned for the projects
        Example
            $projects = Get-AllProjects $conn "project1,project2,project3"
                  
    Get-ProjectsByIds
        Details
            Function to get a list of projects filtered by CVS string of project ids
        Parameters
            CxOneConnObj - Checkmarx One connection object
            projectIds - CSV string of project Ids to filter results returned
            getBranches - Optional switch to determine if project branches should be returned for the projects
        Example
            $projects = Get-AllProjects $conn "<project_id_1>,<project_id_2>,<project_id_3>"
        
    Get-AllScans
        Details
            Function to get all scans filtered by statuses provided as a CSV string.
            Valid Statuses are Queued, Running, Completed, Failed, Partial, Canceled
            All Statuses are required pass $null or empty string for statuses
        Parameters
            CxOneConnObj - Checkmarx One connection object
            statuses - CSV string of scan statuses to filter results
        Example
            $scans = Get-AllScans $conn "Completed,Partial"
            
    Get-AllScansByDays
        Details
            Function to get all scans filtered by statuses provided as a CSV string and number of days.
            Valid Statuses are Queued, Running, Completed, Failed, Partial, Canceled
            If all Statuses are required pass $null or empty string for statuses
            Number of days must be a integer greater or equal to 0. 0 will return all days
        Parameters
            CxOneConnObj - Checkmarx One connection object
            statuses - CSV string of scan statuses to filter results
            scanDays - Integer value between 0 and 366 to specifiy the number of days to return scan for. 0 returns all scans
        Example
            $scans = Get-AllScans $conn "Completed,Partial" 90
        
    Get-LastScans
        Details
            Get the last scan for the projects provided in the projects list. 
            Optional switch to return last scan for Main Branch (if set)
        Parameters
            CxOneConnObj - Checkmarx One connection object
            projectsList - List of projects to return last of. Must be a list as provided by call above
            useMainBranch - optional switch to specify only return last scan on Main branch (if set)
        Example
            $scans = Get-LastScans $conn $projects
            
    Get-LastScansForGivenBranches
        Details
            Get the last scan for the projects provided in the projects list. 
            Returns last scan for the branch provided in the CSV file
            branchesCSV must be a file path to a CSV with the header Projects,Branches and one project,branch per line
        Parameters
            CxOneConnObj - Checkmarx One connection object
            projectsList - List of projects to return last of. Must be a list as provided by call above
            branchesCSV - file path to CSV file containing the mapping of projects to primary branch
        Example
            $scans = Get-LastScansForGivenBranches $conn $projects "C:\files\branches.csv"
            
    Get-ScanResults
        Details
            Get the results for a given scan ID
            Returns a list of result objects
        Parameters
            CxOneConnObj - Checkmarx One connection object
            scanId - The ID of the scan results to return
        Example
            $results = Get-ScanResults $conn "<scan_id>"
