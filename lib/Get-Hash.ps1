Param(
  [string]$filename,
  [string]$algorithm
)
if($filename){
  try{
    $hash = Get-FileHash $filename -algorithm $algorithm;
  }
  catch{
    $popup = New-Object -ComObject Wscript.Shell;
    $popup.Popup("$($algorithm.ToUpper()) is not a valid algorithm.", 0, "Invalid Input", 0x0);
  }
  if($hash){
    $popup = New-Object -ComObject Wscript.Shell;
    $popup.Popup("$($algorithm.ToUpper()) for $($filename)`n`n$($hash.Hash)", 0, "$($algorithm.ToUpper())", 0x0);
  }
}
