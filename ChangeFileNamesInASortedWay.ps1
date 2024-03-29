
$path = "C:\Users\Ali\Music\iTunes\iTunes Media\Music\Richard Dawkins"
$global:destPath = "C:\Users\Ali\Music\iTunes\iTunes Media\Music\Output"

$extraPathTemplate = "CD"

$global:counter = 1

Function renameFiles ($folderPath)
{
    $allFiles = Get-ChildItem -Path $folderPath
    foreach ($item in $allFiles)
    {
        if ($item.Attributes -ne "Directory")
        {
            $fullFilePath = $folderPath + "\" + $item
            Write-Host $fullFilePath
            $paddedCounter = $global:counter.ToString("0000")
            $newName = [string]$paddedCounter + ".m4a"
            Write-Host $newName
            Rename-Item -path $fullFilePath -newname $newName
            $global:counter++
        }
    }
    
    $copySourcePath = $folderPath + "\*.m4a"
    Copy-Item $copySourcePath $global:destPath
}

for ($i=1; $i -le 9; $i++)
{
    $finalPath = $path + "\" + $extraPathTemplate + "0" + $i
    renameFiles($finalPath)
}

for ($i=10; $i -le 14; $i++)
{
    $finalPath = $path + "\" + $extraPathTemplate + $i
    renameFiles($finalPath)
}


Write-Host "Done!"