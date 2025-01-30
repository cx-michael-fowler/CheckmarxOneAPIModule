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
            Connection object contains the BaseURI and Authorisdation Headers
        Parameters
            No Parameters required
        Example 
            $conn = New-Connection
    
    New-SilentConnection
        Details
            Function to create a Checkmarx Connection object with a provided API Key
            Connection object is needed for additional calls in modeule
            Connection object contains the BaseURI and Authorisdation Headers
        Parameters
            apikey - Checkmarx One API key
        Example
            $conn = New-SilentConnection "<API_KEY>"
        
    Get-AllProjects
        Details
            Function to return a Hash of all projects with Key = Project ID and Value = Project Object 
            Returns a Hash of project objects
        Parameters
            CxOneConnObj - Checkmarx One connection object
            getBranches - Optional switch to determine if project branches should be returned for the projects
        Example
            $projects = Get-AllProjects $conn
    
    Get-ProjectsByNames
        Details 
            Function to get a hash of projects filtered by CSV string of project names
            Key = Project ID and Value = Project Object 
        Parameters
            CxOneConnObj - Checkmarx One connection object
            projectNames - CSV string of project names to filter results returned
            getBranches - Optional switch to determine if project branches should be returned for the projects
        Example
            $projects = Get-AllProjects $conn "project1,project2,project3"
                  
    Get-ProjectsByIds
        Details
            Function to get a hash of projects filtered by CVS string of project ids
            Key = Project ID and Value = Project Object 
        Parameters
            CxOneConnObj - Checkmarx One connection object
            projectIds - CSV string of project Ids to filter results returned
            getBranches - Optional switch to determine if project branches should be returned for the projects
        Example
            $projects = Get-AllProjects $conn "<project_id_1>,<project_id_2>,<project_id_3>"
        
    Get-AllScans
        Details
            Function to get a hash of scans filtered by statuses provided as a CSV string
            Key = Scan ID and Value = Scan Object 
            Valid Statuses are Queued, Running, Completed, Failed, Partial, Canceled
            All Statuses are required pass $null or empty string for statuses
        Parameters
            CxOneConnObj - Checkmarx One connection object
            statuses - CSV string of scan statuses to filter results
        Example
            $scans = Get-AllScans $conn "Completed,Partial"
            
    Get-AllScansByDays
        Details
            Function to get a hash of all scans filtered by statuses provided as a CSV string and number of days.
            Key = Scan ID and Value = Scan Object
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
            Get a hash of the the last scans for the projects provided in the projects hash.
            Key = Scan ID and Value = Scan Object
            Optional switch to return last scan for Main Branch (if set)
        Parameters
            CxOneConnObj - Checkmarx One connection object
            projectsHash - Hash of projects to return last of. Must be a hash as provided by call above
            useMainBranch - optional switch to specify only return last scan on Main branch (if set)
        Example
            $scans = Get-LastScans $conn $projects
            
    Get-LastScansForGivenBranches
        Details
            Get a hash of the last scan for the projects provided in the projects hash.
            Key = Scan ID and Value = Scan Object
            Returns last scan for the branch provided in the CSV file
            branchesCSV must be a file path to a CSV with the header Projects,Branches and one project,branch per line
        Parameters
            CxOneConnObj - Checkmarx One connection object
            projectsHash - Hash of projects to return last of. Must be a hash as provided by call above
            branchesCSV - file path to CSV file containing the mapping of projects to primary branch
        Example
            $scans = Get-LastScansForGivenBranches $conn $projects "C:\files\branches.csv"
            
    Get-ScanResults
        Details
            Get the results for a given scan ID
            Returns a hash of result objects
            Key = Scan ID and Value = Result Object
        Parameters
            CxOneConnObj - Checkmarx One connection object
            scanId - The ID of the scan results to return
        Example
            $results = Get-ScanResults $conn "<scan_id>"

    Get-SeverityCounters
        Details
            Get a hash with the severity counters for a given hash of Scans
            Returns a hash with Key = Scan ID and Value = Severity Counter Object
        Parameters
            CxOneConnObj - Checkmarx One connection object
            scansHash - Hash of Scans to return counters for. Must be a hash as provided by call above
        Example
            $results = Get-SeverityCounters $conn $scanHash
