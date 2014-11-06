# *************************************************************************
# Script Name: GuessMyNumber.ps1 (The Guess My Number Game)
# Version: 1.0.1
# Author: Peter M., Colin M. Moats & Chris Topel
# Date: 6/10/2009 - February 27, 2014
#
# Description: This PowerShell script challenges the player to attempt
# to guess a randomly generated number in the range of
# 1 to 100 in as few guesses as possible.
# *************************************************************************

clear
$rand = New-Object system.random
$RandomNumber = $rand.next(1,101)
[int]$answer = ""
$replay = ""

Write-Host "`n`n`n`n`t`t      WELCOME  TO  THE GUESS" -foregroundcolor "yellow"
Write-Host "`n`n`n`t`t`t MY NUMBER  GAME" -foregroundcolor "yellow"
Write-Host "`n`n`n`t`t`t   Chris Topel" -foregroundcolor "blue"
Write-Host "`n`n`n`n`n`n`n`n`n`n Press Enter to continue."

Read-Host

do { $answer = read-host -prompt "What is your guess?"
	if ($answer -gt $RandomNumber) {clear; Write-Host "Too High!"}
	elseif ($answer -lt $RandomNumber) {clear; Write-Host "Too Low!"}
	$guesses = $guesses + 1
 } while ($answer -ne $RandomNumber)
 
Write-Host "`n Game Stats"
Write-Host " ___________________________"
Write-Host "`n The random number was: " -noNewLine
Write-Host "$RandomNumber" -foregroundcolor yellow -noNewLine
Write-Host "`n You got it in " -noNewLine
Write-Host "$guesses" -foregroundcolor yellow -noNewLine
Write-Host " guesses.`n"
Write-Host " ___________________________"
Write-Host "`n`n`n`n`n`n`n`n`n`n`n`n Press Enter to continue."

Read-Host


	clear
	Write-Host
	$replay = Read-Host " Would you like to play again? (Y/N) "

if ($replay -eq "Y") {
	$guesses= 1;./GuessMyNumber.ps1
	}
elseif ($replay -eq "N") {
	clear;Break
	}
