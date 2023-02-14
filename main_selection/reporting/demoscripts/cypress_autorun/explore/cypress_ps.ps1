
$rvd_project_location = "c:\rvd\rvd_portal"


# cd c:\rvd\rvd_portal
cd $rvd_project_location
node_modules\.bin\cypress open


# PowerShell.exe -windowstyle hidden { 
#     Set-Location $rvd_project_location
#     node_modules\.bin\cypress open
#  }
