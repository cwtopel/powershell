#**************************************************************************
#
# Script Name: FortuneTeller.ps1 (PowerShell Fortune Teller)
# Version:		1.0
# Author:		Colin M. Moats
# Date:			6/9/09
#
# Descrpition: 	This PowerShell script provides random answers to player
#				questions.
#
#**************************************************************************

Clear-Host

$question = ""
$status = "Play"
$randomNo = New-Object System.Random
$answer = 0
$time = (Get-Date).Hour

Write-Host
Write-Host
Write-Host
Write-Host
Write-Host "           W E L C O M E  T O  T H E  W I N D O W S"
Write-Host
Write-Host
Write-Host
Write-Host "       P O W E R S H E L L  F O R T U N E  T E L L E R"
Write-Host
Write-Host
Write-Host
Write-Host "                     By Colin M. Moats"
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host " Press Enter to continue."

Read-Host
Clear-Host

Write-Host
Write-Host " The fortune teller isa very busy and impatient mystic. Make"
Write-Host
Write-Host " your questions brief and simple and only expect to recieve"
Write-Host
Write-Host " Yes / No styled answers."
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host " Press Enter to continue."

Read-Host

while ($status -ne "Stop") {

	while ($question -eq "") {
	Clear-Host
	Write-Host
	$question = read-host " What is your question "
	
	}
	
	$question = ""
	
	$answer = $randomNo.Next(1, 5)
	
	if ($time -gt 12) {
		Write-Host
		if ($answer -eq 1) { " Grrrr. The answer is no!" }
		if ($answer -eq 2) { " Grrrr. The answer is never!" }
		if ($answer -eq 3) { " Grrrr. The answer is unclear!" }
		if ($answer -eq 4) { " Grrrr. The answer is yes!" }
	}
	
	else {
		Write-Host
		if ($answer -eq 1) { "Ah. The answer is yes!" }
		if ($answer -eq 2) { "Ah. The answer is always!" }
		if ($answer -eq 3) { "Ah. The answer is uncertain!" }
		if ($answer -eq 4) { "Ah. The answer is no!" }
	}
	
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host
	Write-Host " Press Enter to continue."
	
	Read-Host
	Clear-host
	Write-Host
	
	$reply = read-host "Press Enter to ask another question or type q to quit."
	if ($reply -eq "q") { $status = "Stop" }
	
}

Clear-Host


Write-Host
Write-Host " Very well then. Please return again to get all your questions"
Write-Host " answerd."
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host " Press Enter to continue."

Read-Host
Clear-Host
