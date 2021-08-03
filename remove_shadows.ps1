Get-WmiObject Win32_Shadowcopy | ForEach-Object {
	Write-Host "Deleting VSS " $_.ID.ToLower()
	$cmd = "delete shadows /shadow=" + $_.ID.ToLower() + " /quiet"
	Start-Process -FilePath $env:SystemRoot\system32\vssadmin.exe -ArgumentList $cmd -Wait
	}