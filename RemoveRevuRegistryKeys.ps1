
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$fileEntries = [IO.Directory]::GetFiles("C:\Users\Ali\SkyDrive\Crabcakeali\technical\Data"); 
foreach($fileName in $fileEntries) 
{
	$newName = [IO.Path]::ChangeExtension($fileName, ".xml")
	rename-item $fileName $newName
	[Console]::WriteLine($newName);
}    

# $a = HKCR:\Installer\Assemblies> dir *Bluebeam* | Format-Table -Property Name
# Remove-Item -Path $a -Recurse