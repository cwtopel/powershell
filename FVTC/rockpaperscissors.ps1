#############################################################################
#############################################################################
##                                                                         ##
## Script Name: RPS.ps1 (The Rock, Paper, Scissors Game)                   ##
## Version:		1.1                                                        ##
## Author:		Colin M. Moats, Chris Topel                                ##
## Date:			3/20/2014                                              ##
##                                                                         ##
## Descrpition: This PowerShell script challenges the player to beat the   ##
##				computer in a game of "Rock, Paper, Scissors".             ##
##                                                                         ##
#############################################################################
#############################################################################
clear
Set-Alias ds Write-Host

$playGame = "True"
$randomNo = New-Object System.Random
$number = 0
$guess = 0
$playerMove = ""
$computerMove = ""
$noPlayed = 0
$noWon = 0
$noLost = 0
$noTied = 0

ds "`t`t`t`t                   _    " -foregroundcolor red
ds "`t`t`t`t                   | |   " -foregroundcolor red
ds "`t`t`t`t     _ __ ___   ___| | __" -foregroundcolor red
ds "`t`t`t`t    | '__/ _ \ / __| |/ /" -foregroundcolor red
ds "`t`t`t`t    | | | (_) | (__|   < " -foregroundcolor red
ds "`t`t`t`t    |_|  \___/ \___|_|\_\" -foregroundcolor red
ds "`t`t`t`t                         " 
ds "`t`t`t`t                         "
ds "`t`t`t`t     _ __   __ _ _ __   ___ _ __ " -foreground green
ds "`t`t`t`t    | '_ \ / _`` | '_ \ / _ \ '__|" -foreground green
ds "`t`t`t`t    | |_) | (_| | |_) |  __/ |   " -foreground green
ds "`t`t`t`t    | .__/ \__,_| .__/ \___|_|   " -foreground green
ds "`t`t`t`t    | |         | |              " -foreground green
ds "`t`t`t`t    |_|         |_|              " -foreground green

ds "`t`t`t`t              _                        " -foregroundcolor magenta
ds "`t`t`t`t             (_)                       " -foregroundcolor magenta
ds "`t`t`t`t     ___  ___ _ ___ ___  ___  _ __ ___ " -foregroundcolor magenta
ds "`t`t`t`t    / __|/ __| / __/ __|/ _ \| '__/ __|" -foregroundcolor magenta
ds "`t`t`t`t    \__ \ (__| \__ \__ \ (_) | |  \__ \" -foregroundcolor magenta
ds "`t`t`t`t    |___/\___|_|___/___/\___/|_|  |___/" -foregroundcolor magenta
ds "`t`t`t`t                                       "
ds "`t`t`t`t     _ _                  _ " -foregroundcolor cyan
ds "`t`t`t`t    | (_)                | |" -foregroundcolor cyan
ds "`t`t`t`t    | |_ ______ _ _ __ __| |" -foregroundcolor cyan
ds "`t`t`t`t    | | |_  / _`` | '__/ _  |" -foregroundcolor cyan
ds "`t`t`t`t    | | |/ / (_| | | | (_| |" -foregroundcolor cyan
ds "`t`t`t`t    |_|_/___\__,_|_|  \__,_|" -foregroundcolor cyan
ds "`t`t`t`t                            "
ds "`t`t`t`t                           _    " -foregroundcolor darkcyan
ds "`t`t`t`t                          | |   " -foregroundcolor darkcyan
ds "`t`t`t`t      ___ _ __   ___   ___| | __" -foregroundcolor darkcyan
ds "`t`t`t`t     / __| '_ \ / _ \ / __| |/ /" -foregroundcolor darkcyan
ds "`t`t`t`t     \__ \ |_) | (_) | (__|   < " -foregroundcolor darkcyan
ds "`t`t`t`t     |___/ .__/ \___/ \___|_|\_\" -foregroundcolor darkcyan
ds "`t`t`t`t         | |                    " -foregroundcolor darkcyan
ds "`t`t`t`t         |_|                    " -foregroundcolor darkcyan

ds "`n`n`n`t`t`t`t         By Chris MF'n Topel"
ds "`n`n`n`n`n`n`n Press Enter to continue."

Read-Host
clear

while ($playGame -ne "False") {
	$number = $randomNo.Next(1, 6)
	if ($number -eq 1) {$computerMove = "Rock" }
	if ($number -eq 2) {$computerMove = "Paper" }
	if ($number -eq 3) {$computerMove = "Scissors" }
	if ($number -eq 4) {$computerMove = "Lizard" }
	if ($number -eq 5) {$computerMove = "Spock" }
	
	while ($guess -eq "") {
		clear
		ds "`n`n"
		ds "Enter one of the following options`n"
		ds "-------------------`n"
		ds " R" -foregroundcolor yellow -noNewLine
		ds " =" -noNewLine
		ds " Rock" -foregroundcolor yellow
		ds " P" -foregroundcolor red -noNewLine
		ds " =" -noNewLine
		ds " Paper" -foregroundcolor red
		ds " S" -foregroundcolor blue -noNewLine
		ds " =" -noNewLine
		ds " Scissors" -foregroundcolor blue
		ds " L" -foregroundcolor cyan -noNewLine
		ds " =" -noNewLine
		ds " Lizard" -foregroundcolor cyan
		ds " S" -foregroundcolor darkcyan -noNewLine
		ds " =" -noNewLine
		ds " Spock" -foregroundcolor darkcyan
		ds " Q" -foregroundcolor green -noNewLine
		ds " =" -noNewLine
		ds " Quit`n" -foregroundcolor green
		ds "--------------------`n`n`n`n`n`n`n`n`n"
		
		$guess = Read-Host "Make a move"
	}
	
	if ($guess -eq "Q") {
		clear
		ds "`n`n"
		ds "Game over. Thanks for playing!"
		ds "`n`n"
		ds "`n`n`n Game Stats`n" -foregroundcolor green
		ds "-------------------`n"	
		ds "`n Number of games played: $noPlayed"	
		ds "`n Number of games won: $noWon"
		ds "`n Number of games lost: $noLost"
		ds "`n Number of games tied: $noTied`n"
		ds "-------------------`n"
		ds "Press Enter to quit the game."
		
		Read-Host
		$playGame = "False"
		continue
	}
	
	elseif (($guess -ne "R") -and ($guess -ne "L") -and ($guess -ne "Sp") -and ($guess -ne "P") -and ($guess -ne "S")) {
		clear
		ds "`n`n`n Invalid input. Please try again."
		Read-host
		$guess = ""
		continue
	}
	
	if ($guess -eq "R") {$playerMove = "Rock"}
	if ($guess -eq "P") {$playerMove = "Paper"}
	if ($guess -eq "S") {$playerMove = "Scissors"}
	if ($guess -eq "L") {$playerMove = "Lizard"}
	if ($guess -eq "Sp") {$playerMove = "Spock"}

	clear
	ds "`n`n`n Results:`n"
	ds "------------------`n"
	ds "The computer picked: " -noNewLine
	ds "$computerMove`n" -foregroundcolor red
	ds "You picked: " -noNewLine
	ds "$playerMove`n" -foregroundcolor green
	ds "------------------`n"
	$noPlayed += 1
	
	switch ($computerMove) 
	{
		"Rock" {
			if ($playerMove -eq "Rock") {
				$noTied += 1
				ds "You've Tied!"
			}
			if ($playerMove -eq "Paper") {
				$noWon += 1
				ds "You've Won!"
			}
			if ($playerMove -eq "Scissors") {
				$noLost += 1
				ds "You've Lost!"
			}
			if ($playerMove -eq "Lizard") {
				$noLost += 1
				ds "You've Lost!"
			}	
			if ($playerMove -eq "Spock") {
				$noWon += 1
				ds "You've Won!"
			}
		}
				"Paper" {
			if ($playerMove -eq "Rock") {
				$noLost += 1
				ds "You've Lost!"
			}
			if ($playerMove -eq "Paper") {
				$noTied += 1
				ds "You've Tied!"
			}
			if ($playerMove -eq "Scissors") {
				$noWon += 1
				ds "You've Won!"
			}
			if ($playerMove -eq "Lizard") {
				$noWon += 1
				ds "You've Won!"
			}
			if ($playerMove -eq "Spock") {
				$noLost += 1
				ds "You've Lost!"
			}
		}
				"Scissors" {
			if ($playerMove -eq "Rock") {
				$noWon += 1
				ds "You've Won!"
			}
			if ($playerMove -eq "Paper") {
				$noLost += 1
				ds "You've Lost!"
			}
			if ($playerMove -eq "Scissors") {
				$noTied += 1
				ds "You've Tied!"
			}
			if ($playerMove -eq "Lizard") {
				$noLost += 1
				ds "You've Lost!"
			}
			if ($playerMove -eq "Spock") {
				$noWon += 1
				ds "You've Won!"
			}
		}
				"Lizard" {
			if ($playerMove -eq "Rock") {
				$noWon += 1
				ds "You've Won!"
			}
			if ($playerMove -eq "Paper") {
				$noLost += 1
				ds "You've Lost!"
			}
			if ($playerMove -eq "Scissors") {
				$noWon += 1
				ds "You've Won!"
			}
			if ($playerMove -eq "Lizard") {
				$noTied += 1
				ds "You've Tied!"
			}
			if ($playerMove -eq "Spock") {
				$noLost += 1
				ds "You've Lost!"
			}
		}
				"Spock" {
			if ($playerMove -eq "Rock") {
				$noLost += 1
				ds "You've Lost!"
			}
			if ($playerMove -eq "Paper") {
				$noWon += 1
				ds "You've Won!"
			}
			if ($playerMove -eq "Scissors") {
				$noLost += 1
				ds "You've Lost!"
			}
			if ($playerMove -eq "Lizard") {
				$noWon += 1
				ds "You've Won!"
			}
			if ($playerMove -eq "Spock") {
				$noTied += 1
				ds "You've Tied!"
			}
		}
	}
	
	Read-Host
	
	$number = 0
	$guess = 0
	$playerMove = ""
	$computerMove = ""
	
	clear
	
	#ds "`n`n`n Game Stats`n" -foregroundcolor green
	#ds "-------------------`n"	
	#ds "`n Number of games played: $noPlayed"	
	#ds "`n Number of games won: $noWon"
	#ds "`n Number of games lost: $noLost"
	#ds "`n Number of games tied: $noTied`n"
	#ds "-------------------`n"
	#ds "`n`n`n`n`n`n`n Press Enter to continue."
	#Read-Host
	#clear
}
