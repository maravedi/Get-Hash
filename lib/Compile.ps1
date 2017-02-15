$OldErrorActionPreference = $ErrorActionPreference
$ErrorActionPreference = 'Stop'
try{
  $compile = powershell.exe -noprofile -executionpolicy bypass -file "$($PSScriptRoot)\ps2exe.ps1" -inputfile "$($PSScriptRoot)\Get-Hash.ps1" -outputfile .\Get-Hash.exe -noconsole
}
catch{
  $error[0]
  exit
}
$ErrorActionPreference = $OldErrorActionPreference
if($compile -Like "*Config file for EXE created.*"){
  del .\Get-Hash.exe.config
  Write-Host "Get-Hash.exe successfully compiled."
}
else{
  $compile
} 
