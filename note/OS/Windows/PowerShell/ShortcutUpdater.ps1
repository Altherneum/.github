$folderPath = "C:\Users\user\Mon Drive"

$files = Get-ChildItem -Path $folderPath -Recurse
$shell = New-Object -ComObject WScript.Shell

$oldPath = "G:\Mon Drive\*"
$oldPathRegex = "G:\Mon Drive\"
$newPath = "C:\Users\user\Mon Drive\"

foreach ($file in $files) {
	if (($file.Extension).Split(".") -eq "lnk") {
		$shortcut = $shell.CreateShortcut($file.FullName)

		if($shortcut.TargetPath -like $oldPath) {
			Write-Host $file.FullName

			$shortcut.TargetPath = $shortcut.TargetPath -replace [regex]::Escape($oldPathRegex), $newPath
			$shortcut.WorkingDirectory = $shortcut.WorkingDirectory -replace [regex]::Escape($oldPathRegex), $newPath

			$shortcut.Save()
		}
	}
}