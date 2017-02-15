Get-Hash - Get File Hashes From Right-Click Context Menu
=======================

A simple PowerShell script to add options in the Right-Click Context Menu for getting the hash of a file.  For simplicity, this uses the PS2EXE (https://gallery.technet.microsoft.com/PS2EXE-Convert-PowerShell-9e4e07f1) script to convert the main hashing script to an .exe file.

## Instructions
Run the Install.ps1 script to add the necessary registry keys for the context menu items.  If you would like more algorithms, then go into the lib folder and edit the Install.ps1 file.  You do not need to re-compile Get-Hash.exe if you add more algorithms to the Install.ps1 file.  Simply run the Install.ps1 file again after making the changes, and it will add the new items to the context menu.
