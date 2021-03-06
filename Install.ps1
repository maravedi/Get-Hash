.\lib\CheckCompile.ps1


#########################################################################
#  Below will prompt the user to run the script as Admin, or else fail
#########################################################################

  # Get the ID and security principal of the current user account
  $myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
  $myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)
 
  # Get the security principal for the Administrator role
  $adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator
 
  # Check to see if we are currently running "as Administrator"
  if ($myWindowsPrincipal.IsInRole($adminRole))
     {
     # We are running "as Administrator" - so change the title and background color to indicate this
     $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
     $Host.UI.RawUI.BackgroundColor = "DarkBlue"
     clear-host
     }
  else
     {
     # We are not running "as Administrator" - so relaunch as administrator
   
     # Create a new process object that starts PowerShell
     $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   
     # Specify the current script path and name as a parameter
     $newProcess.Arguments = "-noprofile", $myInvocation.MyCommand.Definition;
   
     # Indicate that the process should be elevated
     $newProcess.Verb = "runas";
   
     # Start the new process
     [System.Diagnostics.Process]::Start($newProcess);
   
     # Exit from the current, unelevated, process
     exit
     }

#########################################################################

  # Define the algorithms needed for hashing
  # At the time this script was created, the only options available are:
  # SHA1, SHA256, SHA384, SHA512, MACTripleDES, MD5, RIPEMD160
  $Algorithms = @('SHA256', 'MD5')

  # Get the current directory of this script
  $dir = $PSScriptRoot 

  # Create a directory alias for HKEY_CLASSES_ROOT so we can set that as current directory
  New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
  # Set the current directory as the new alias for HKEY_CLASSES_ROOT:\*\shell
  Set-Location -LiteralPath HKCR:\*\shell
  
  # Iterate through each algorithm and create a new registry path and key for the command
  # The %V in the command registry key will take in the filename from the right click context menu
  Foreach($Algorithm in $Algorithms){
    New-Item -Name "Get-$Algorithm" -Value ''
    New-Item ".\Get-$($Algorithm)" -Name command -Value "`"$($dir)\Get-Hash.exe`" `"%V`" `"$Algorithm`""
  }
