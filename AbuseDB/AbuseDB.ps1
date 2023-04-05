
$ApiKey = "b6f0e3e2faf982b866a93f8cad904faf8f39a9dcb38ee9aab3b68ac94282676d3a7df552df4e4938"

if ($ApiKey.Length -eq 0){
Write-Warning "[!] Enter your Apikey in AbuseDB.ps1 file"
pause
exit			
}

Else {

}

$RutaAbuse = "\data\AbuseDB-output.json" 
$ips = Get-Content -Path "file.txt" | Sort-Object -Property Length | Select-Object -Unique

$total = $ips.count

Write-host ""
Write-Host @"
                       _                        _____   ____
                /\    | |                      |  __ \ |  _ \
               /  \   | |__   _   _  ___   ___ | |  | || |_) |
              / /\ \  | '_ \ | | | |/ __| / _ \| |  | ||  _ <
             / ____ \ | |_) || |_| |\__ \|  __/| |__| || |_) |
            /_/    \_\|_.__/  \__,_||___/ \___||_____/ |____/


"@ -ForegroundColor Yellow 

Write-host "Total IPs: " -nonewline
Write-host "$total" -nonewline -ForegroundColor Yellow
Write-host ""
Write-host ""

$i=0
$myvar = @()
$url = "https://api.abuseipdb.com/api/v2/check"

$tiempo = Measure-Command {
foreach ($ip in $ips) {
 
	$i=$i++

	
    $params = @{
        "ipAddress" = $ip
        "verbose" = "true"
    }
	
    $headers = @{
        "Key" = "$ApiKey"
        "Accept" = "application/json"
    }

			
	$response = Invoke-RestMethod -Uri $url -Method Get -Headers $headers -Body $params
	
	$i++
	
	
	$myvar += $response
	$resultado = $response.data.reports.categories
	$numeros = $resultado -split " "
			
	$agrupado = $numeros | group | select name, count | sort count -Descending | Select-Object -First 1
			
				$agrupado | ForEach-Object {
					if ($_.Name -eq "1") {
						$_.Name = "DNS Compromise"
						$Nombrecategoria = $_ | Select-Object -ExpandProperty Name
						$nombre = "DNS-Compromise "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "2") {
						$_.Name = "DNS Poisoning"
						$Nombrecategoria =$_ | Select-Object -ExpandProperty Name
						$nombre = "DNS-Poisoning "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "3") {
						$_.Name = "Fraud Orders"
						$Nombrecategoria =$_ | Select-Object -ExpandProperty Name
						$nombre = "Fraud-Orders "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "4") {
						$_.Name = "DDoS Attack"
						$Nombrecategoria =$_ | Select-Object -ExpandProperty Name
						$nombre = "DDoS-Attack "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "5") {
						$_.Name = "FTP Brute-Force"
						$Nombrecategoria =$_ | Select-Object -ExpandProperty Name
						$nombre = "FTP-Brute-Force "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "6") {
						$_.Name = "Ping of Death"
						$Nombrecategoria =$_ | Select-Object -ExpandProperty Name
						$nombre = "Ping-of-Death "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "7") {
						$_.Name = "Phishing"
						$Nombrecategoria =$_ | Select-Object -ExpandProperty Name
						$nombre = "Phishing "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "8") {
						$_.Name = "Fraud VoIP"
						$Nombrecategoria =$_ | Select-Object -ExpandProperty Name
						$nombre = "Fraud-VoIP "
						$myvar1 += $nombre
					}
					
					elseif ($_.Name -eq "9") {
						$_.Name = "Open Proxy"
						$Nombrecategoria = $_ | Select-Object -ExpandProperty Name
						$nombre = "Open-Proxy "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "10") {
						$_.Name = "Web Spam"
						$Nombrecategoria = $_ | Select-Object -ExpandProperty Name
						$nombre = "Web-Spam "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "11") {
						$_.Name = "Email Spam"
						$Nombrecategoria = $_ | Select-Object -ExpandProperty Name
						$nombre = "Email-Spam "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "12") {
						$_.Name = "Blog Spam"
						$Nombrecategoria = $_ | Select-Object -ExpandProperty Name
						$nombre = "Blog-Spam "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "13") {
						$_.Name = "VPN IP"
						$Nombrecategoria = $_ | Select-Object -ExpandProperty Name
						$nombre = "VPN-IP "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "14") {
						$_.Name = "Port Scan"
						$Nombrecategoria = $_ | Select-Object -ExpandProperty Name
						$nombre = "Port-Scan "
						$myvar1 += $nombre
						
					}
					elseif ($_.Name -eq "15") {
						$_.Name = "Hacking"
						$Nombrecategoria = $_ | Select-Object -ExpandProperty Name
						$nombre = "Hacking "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "16") {
						$_.Name = "SQL Injection"
						$Nombrecategoria = $_ | Select-Object -ExpandProperty Name
						$nombre = "SQL-Injection "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "17") {
						$_.Name = "Spoofing"
						$Nombrecategoria = $_ | Select-Object -ExpandProperty Name
						$nombre = "Spoofing "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "18") {
						$_.Name = "Brute-Force"
						$Nombrecategoria = $_ | Select-Object -ExpandProperty Name
						$nombre = "Brute-Force "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "19") {
						$_.Name = "Bad Web Bot"
						$Nombrecategoria = $_ | Select-Object -ExpandProperty Name
						$nombre = "Bad-Web-Bot "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "20") {
						$_.Name = "Exploited Host"
						$Nombrecategoria = $_ | Select-Object -ExpandProperty Name
						$nombre = "Exploited-Host "
						$myvar1 += $nombre
						
					}
					elseif ($_.Name -eq "21") {
						$_.Name = "Web App Attack"
						$Nombrecategoria = $_ | Select-Object -ExpandProperty Name
						$nombre = "Web-App-Attack "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "22") {
						$_.Name = "SSH"
						$Nombrecategoria = $_ | Select-Object -ExpandProperty Name
						$nombre = "SSH "
						$myvar1 += $nombre
					}
					elseif ($_.Name -eq "23") {
						$_.Name = "IoT Targeted"
						$Nombrecategoria = $_ | Select-Object -ExpandProperty Name
						$nombre = "IoT Targeted "
						$myvar1 += $nombre
					}
					else {
						$Nombrecategoria = "No-reported"
						$nombre = "No-reported "
						$myvar1 += $nombre
					}	
				}

			
				If ($response.data.abuseConfidenceScore -ge "80" -and $response.data.abuseConfidenceScore -le "100"){
					$color = "Red"
					$Fcolor = "black"
				}
				elseif ($response.data.abuseConfidenceScore -ge "50" -and $response.data.abuseConfidenceScore -le "80"){
					$color = "DarkRed"
					$Fcolor = "black"
				}
				elseif ($response.data.abuseConfidenceScore -ge "10" -and $response.data.abuseConfidenceScore -le "50"){
					$color = "Yellow"
					$Fcolor = "black"
				}
				elseif ($response.data.abuseConfidenceScore -ge "2" -and $response.data.abuseConfidenceScore -le "10"){
					$color = "Blue"
					$Fcolor = "white"
				}
				else{
					$color = "Green"
					$Fcolor = "black"
				}
			
			
				Write-Host "[$i] " -NoNewLine -ForegroundColor Yellow
				Write-Host "IP: " -NoNewLine
				Write-Host "$($response.data.ipAddress) " -ForegroundColor Green -NoNewLine
				Write-Host "Score: " -NoNewLine
				Write-Host "$($response.data.abuseConfidenceScore)" -ForegroundColor $Fcolor -BackgroundColor $color -NoNewLine
				Write-Host " Country: " -NoNewLine
				Write-Host "$($response.data.countryCode)" -ForegroundColor Green -NoNewLine
				Write-Host " TotalReports: " -NoNewLine
				Write-Host "$($response.data.totalReports)" -ForegroundColor Green -NoNewLine
				Write-Host " Distinc users: " -NoNewLine
				Write-Host "$($response.data.numDistinctUsers)" -ForegroundColor Green -NoNewLine
				Write-Host " Top Category: " -NoNewLine 
				Write-Host "$Nombrecategoria " -ForegroundColor Green
			


}
}



$myvar2 = $myvar1 -split " "
$segundos = $tiempo.TotalSeconds
$formatoSegundos = "{0:N2}" -f $segundos
$media = ($tiempo.TotalSeconds)/$total
$mediaformato = "{0:N2}" -f $media

Write-host ""
Write-Host "- Total request time: " -nonewline
Write-Host "$($formatoSegundos) " -nonewline -ForegroundColor Yellow
Write-Host "seconds " -nonewline
Write-host "$mediaformato " -nonewlin -ForegroundColor Yellow
Write-host "by request " 


 

			$CustomRutaAbuseDB = "." + $RutaAbuse
			$myvar | ConvertTo-Json -Depth 10 | Out-File -FilePath $CustomRutaAbuseDB      
			$ruta = $PWD
		
			$ficheroExcel = "$ruta\AbuseDB-Report.xlsx"
			$CustomRuta = "$ruta" + "$RutaAbuse"
			$json = Get-Content -Raw $CustomRuta | ConvertFrom-Json
		
			$Excel = New-Object -com Excel.Application
			$Excel.Visible = $false
			$Excel.DisplayAlerts = $false
			
			$Book = $Excel.Workbooks.add()
			$WorkSheet = $Book.Sheets.Item(1)
			$WorkSheet.Name = "AbuseDB"
				
			ForEach($ws in $WorkSheet)

			{

				$ws.Range($ws.Rows(1),$ws.Rows($ws.Rows.Count)).Delete() | Out-null

			}


			$tableRange = $worksheet.Range("A1:J2")
			$table = $worksheet.ListObjects.Add([Microsoft.Office.Interop.Excel.XlListObjectSourceType]::xlSrcRange,$tableRange,$null,[Microsoft.Office.Interop.Excel.XlYesNoGuess]::xlYes,$null)

			$table.ListColumns.Item(1).Name = "IP"
			$table.ListColumns.Item(2).Name = "Score"
			$table.ListColumns.Item(3).Name = "Country Code"
			$table.ListColumns.Item(4).Name = "Country"
			$table.ListColumns.Item(5).Name = "Total Report"
			$table.ListColumns.Item(6).Name = "numDistinctUsers"
			$table.ListColumns.Item(7).Name = "lastReportedAt"
			$table.ListColumns.Item(8).Name = "Category"
			$table.ListColumns.Item(9).Name = "usageType"
			$table.ListColumns.Item(10).Name = "domain"
			
			$table.ListColumns.Item(10).DataBodyRange.NumberFormat = "$#,##0.00"
			
			$ipAddressS = $json.data.ipAddress
			$abuseConfidenceScoreS = $json.data.abuseConfidenceScore
			$countryCodeS = $json.data.countryCode
			$countryNameS = $json.data.countryName
			$totalReportsS = $json.data.totalReports
			$numDistinctUsersS = $json.data.numDistinctUsers
			$lastReportedAtS = $json.data.lastReportedAt
			$categoriasS = $json.data.report.categories
			$usageTypeS = $json.data.usageType
			$domainS = $json.data.domain
			
			
		
			
			
			
			foreach ($ipAddress in $ipAddressS)
					{
						
						$row++ | Out-null
						$table.DataBodyRange.Item($row,1) = "$ipAddress"
							
					}
			$row = 0
			foreach ($abuseConfidenceScore in $abuseConfidenceScoreS)
					{
						
						$row++ | Out-null
						$table.DataBodyRange.Item($row,2) = "$abuseConfidenceScore"
						$table.DataBodyRange.Item($row,2).HorizontalAlignment = -4108
							If ($abuseConfidenceScore -ge "80" -and $abuseConfidenceScore -le "100"){
								$table.DataBodyRange.Item($row,2).Interior.ColorIndex = 3
							}
							elseif ($abuseConfidenceScore -ge "50" -and $abuseConfidenceScore -le "80"){
								$table.DataBodyRange.Item($row,2).Interior.ColorIndex = 45
							}
							elseif ($abuseConfidenceScore -ge "10" -and $abuseConfidenceScore -le "50"){
								$table.DataBodyRange.Item($row,2).Interior.ColorIndex = 6
							}
							Elseif ($abuseConfidenceScore -ge "2" -and $abuseConfidenceScore -le "10"){
								$table.DataBodyRange.Item($row,2).Interior.ColorIndex = 41
							}
							Else {
							$table.DataBodyRange.Item($row,2).Interior.ColorIndex = 10
							
							}
						
					}
					
			$row = 0		
			foreach ($countryCode in $countryCodeS)
					{
						
						$row++ | Out-null
						$table.DataBodyRange.Item($row,3) = "$countryCode"		
						$table.DataBodyRange.Item($row, 3).HorizontalAlignment = -4108
						
					}
					
					
			$row = 0		
			foreach ($countryName in $countryNameS)
					{
						
						$row++ | Out-null
						$table.DataBodyRange.Item($row,4) = "$countryName"		
					}
			
			$row = 0		
			foreach ($totalReports in $totalReportsS)
					{
						
						$row++ | Out-null
						$table.DataBodyRange.Item($row,5) = "$totalReports"	
						$table.DataBodyRange.Item($row,5).HorizontalAlignment = -4108
					}
			
			$row = 0		
			foreach ($numDistinctUsers in $numDistinctUsersS)
					{
						
						$row++ | Out-null
						$table.DataBodyRange.Item($row,6) = "$numDistinctUsers"	
						$table.DataBodyRange.Item($row,6).HorizontalAlignment = -4108
					}
					
			$row = 0		
			foreach ($lastReportedAt in $lastReportedAtS)
					{
						
						$row++ | Out-null
						$table.DataBodyRange.Item($row,7) = "$lastReportedAt"		
					}
				
				
			$row = 0		
			foreach ($cate in $myvar2)
					{
						
						$row++ | Out-null
						$table.DataBodyRange.Item($row,8) = "$cate"						
					}
			
			$row = 0		
			foreach ($usageType in $usageTypeS)
					{
						
						$row++ | Out-null
						$table.DataBodyRange.Item($row,9) = "$usageType"		
					}
					
			$row = 0		
			foreach ($domain in $domainS)
					{
						
						$row++ | Out-null
						$table.DataBodyRange.Item($row,10) = "$domain"		
					}
			
			
			$Book.SaveAs($ficheroExcel) 	
			$Book.Close()
			$Excel.Quit()


Write-host ""
Write-Host "- Report file generated (" -nonewline 
write-host "$ficheroExcel" -nonewline -ForegroundColor Green
write-host ")"
Write-host ""


Pause

