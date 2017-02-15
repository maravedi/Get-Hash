Get-Hash - Get File Hashes From Right-Click Context Menu
=======================

A simple PowerShell script to add options in the Right-Click Context Menu for getting the hash of a file.  For simplicity, this uses the PS2EXE (https://gallery.technet.microsoft.com/PS2EXE-Convert-PowerShell-9e4e07f1) script to convert the main hashing script to an .exe file.

## Instructions
Run the Install.ps1 script to add the necessary registry keys for the context menu items.  If you would like more algorithms, then go into the lib folder and edit the Get-Hash.ps1 file, and then re-compile the Get-Hash.exe file using the Compile.ps1 script in the lib folder.
