$fcInstallPath = "\\server\share\FortiClient.msi"
$fortiClient6000067 = get-WmiObject -Class Win32_Product -namespace "root\cimv2" | Where-object{$_.IdentifyingNumber -match "{CAB92B97-82EB-4210-851E-4B857566CFB8}"}
$fortiClient6010099 = get-WmiObject -Class Win32_Product -namespace "root\cimv2" | Where-object{$_.IdentifyingNumber -match "{E1E1D751-6C0B-4697-88A4-052CABC12DD8}"}
$fortiClient6030155 = get-WmiObject -Class Win32_Product -namespace "root\cimv2" | Where-object{$_.IdentifyingNumber -match "{E869338F-FD3D-4A12-9C1A-5583D1AE23FC}"}
$warnCurrentVer = "Latest version of FortiClient Installed. Exiting."
$warnInstalled = "Uninstalling FortiClient Version "
$warnNotInstalled = "Installing FortiClient Version "

if($fortiClient6000067 -ne $null) {
	
	echo $warnInstalled + "6.0.0.0067"
	(Start-Process -FilePath "msiexec.exe" -ArgumentList "/uninstall /package {CAB92B97-82EB-4210-851E-4B857566CFB8} /QN /L* %USERPROFILE%\Documents\fortiClient6000067_Uninstall.log" -Wait -Passthru).ExitCode
	pause
	Restart-Computer -Force

	} Else {

		if($fortiClient6010099 -ne $null) {

			echo $warnInstalled + "6.0.1.0099"
			(Start-Process -FilePath "msiexec.exe" -ArgumentList "/uninstall /package {E1E1D751-6C0B-4697-88A4-052CABC12DD8} /QN /L* %USERPROFILE%\Documents\fortiClient6010099_Uninstall.log" -Wait -Passthru).ExitCode
			pause
			Restart-Computer -Force

			} Else {

			if($fortiClient6030155 -ne $null) {

				echo $warnCurrentVer
				pause

				} Else {
				
				echo $warnNotInstalled + "6.0.3.0155"
				(Start-Process -FilePath $fcInstallPath -ArgumentList "TRANSFORMS='%~dp0FortiClient.mst' /QN /L* %USERPROFILE%\Documents\fortiClient6030155_Install.log" -Wait -Passthru).ExitCode
				pause
				Restart-Computer -Force
				
				}
			}
		}
