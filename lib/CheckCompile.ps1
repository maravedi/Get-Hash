$CheckForExe = Get-ChildItem -Filter "Get-Hash.exe"

if($CheckForExe.Name){
  #Write-Host "EXE exists"
  return $true
}
else{
  Write-Host "EXE doesn't exist. Run the Compile.ps1 file in the lib directory, then run this installer again."
  break
}
