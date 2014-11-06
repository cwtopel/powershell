#############################################################################
##                                                                         ##
## Script Name: hangman.ps1 -- It plays hangman you idiot.                 ##
## Version:		1.2.1 Regex Fix                                            ##
## Author:		Chris Topel                                                ##
## Date:			3/21/2014                                              ##
##                                                                         ##
## Descrpition: This PowerShell script challenges the player to beat the   ##
##				computer in a game of Hangman.                             ##
##                                                                         ##
#############################################################################
Set-Alias ds Write-Host
Set-Alias rh Read-Host

######################
##  Initialization  ##
######################
$playGame = "False"
$response = ""
$randomNo = New-Object System.Random
$number = 0
$secretWord = ""
$attempts = 0
$status = "True"
$guesses = ""
$reply
$tempstring
$validReply
$rejectList = '~!@#$%^&-_={}]|\:;",.?/<>'
$GuessesRemaining

##################
##    ARRAYS    ##
##################
$words = @{}
$words[0] = @("", "", "", "", "", "", "", "", "", "", "", "", "", "", "")
$words[1] = @("C", "O", "M", "M", "A", "N", "D", "E", "R")
$words[2] = @("F", "L", "A", "G")
$words[3] = @("T", "O", "A", "S", "T", "E", "R")
$words[4] = @("M", "A", "R", "K", "E", "R")
$words[5] = @("P", "I", "C", "T", "U", "R", "E")
$words[6] = @("D", "E", "S", "K")
$words[7] = @("G", "L", "O", "B", "E")
$words[8] = @("S", "P", "E", "A", "K", "E", "R")
$words[9] = @("B", "A", "C", "K", "Y", "A", "R", "D")
$words[10] = @("P", "E", "N", "C", "I", "L")

function Check-Answer {
  param ($reply)

  $script:guesses = $script:guesses + " " + $reply

  for ($i = 0; $i -le $secretWord.length - 1; $i++) {
    if ($secretWord[$i] -ne $reply) {
      if ($words[0][$i] -eq "") {$words[0][$i] = "_"}
    }
    else {
      $words[0][$i] = $reply
    }
  }
}

################################
##  Main Processing Section   ##
################################

while ($playGame -ne "True") {

  clear

  ds "`n`n`n`n"
  ds " Welcome to the                             *********"
  ds "                                            *       *"
  ds " PowerShell Hangman Game!" -foregroundcolor red -noNewLine
  ds "                   O       *"
  ds "                                          __|__     *"
  ds "                                            |       *"
  ds "                                           / \      *"
  ds "                                                    *"
  ds "                                                    *"
  ds "                                                    *"
  ds "                                                 *******"
 
  $response = rh "`n`n`n`n`n`n`n`n Would you like to play a game? (Y/N/CUSTOM)"

	if ($response -eq "Y"){
		$playGame = "True"
	}
	elseif ($response -eq "N") {
		clear
		ds " `n`n Please return and play again soon."
		rh
		exit
	}
	# Add custom gametype for EC
	#elseif ($response -eq "CUSTOM") {
	#
	else {
		clear
		ds "`n`n Invalid input. Please press Enter try again."
		rh
	}
}

while ($status -eq "True") {

	$tempString = ""
	$words[0] = @("", "", "", "", "", "", "", "", "", "", "", "", "", "", "")
	$attempts = 0
	$guesses = ""
	$reply = ""
	
	$number = $randomNo.Next(1, 11)
	$secretWord = $words[$number]
 
	while ($reply -eq "") {
		clear
		$reply = rh "`n`n Enter a guess"

		if ($reply -eq "") {
			continue
		}
		if ($reply.Length -gt 1) {
			clear
			ds "`n`n Error: You may enter only one letter at a time."
			rh "`n`n`n`n`n`n`n`n`n`n`n Press Enter to continue."
			$reply = ""
			continue
		}
		if (1234567890 -match [regex]::Escape($reply)) {
			clear
			ds "`n`n Error: Numeric guesses are not allowed."
			rh "`n`n`n`n`n`n`n`n`n`n`n Press Enter to continue."
			$reply = ""
			continue
		}
		if ($rejectList -match [regex]::Escape($reply)) {
			clear
			ds "`n`n Error: Special characters are not permitted."
			rh "`n`n`n`n`n`n`n`n`n`n`n Press Enter to continue."
			$reply = ""
			continue
		}
	clear
	$attempts++
	Check-Answer $reply
	$tempString = ""

		for ($i = 0; $i -le $words[0].length - 1; $i++) {
			$tempString = $tempString + " " + $words[0][$i]
		}

	ds "`n`n Results:`n"
	ds " ------------------------------------------`n"
	ds " $tempString`n"
	ds " ------------------------------------------`n`n"
	ds " Letters that have been guessed: $guesses`n"

	$GuessesRemaining = (12 - $attempts)

	ds " Number of guesses remaining: $GuessesRemaining"
	rh "`n`n`n`n`n`n`n`n`n Press Enter to continue"

		if ($tempString -notmatch "_") {

			ds "`n Game over. You have guessed the secret word!" -foregroundcolor green `
             "in $attempts guesses.`n`n"
			ds " The secret word was $secretWord `n`n"
			ds "`n`n`n`n`n`n`n`n" `
             "`n`n`n`n`n`n`n"
			rh
			$reply = "Done"
			continue
 
		}
		if ($attempts -eq 12) {
			clear
			ds "`n Game over. You have exceeded the maximum allowed" -foregroundcolor red `
             "number of guesses.`n`n"
			ds " The secret word was $secretWord `n`n"
			ds " The best you could do was $tempString`n`n`n`n`n`n`n`n" `
                 "`n`n`n`n`n`n`n"
			rh
			$reply = "Done"
			continue
		}
$reply = ""
	}
	$response = ""
	$validReply = "False"
	while ($validReply -ne "True") {
		clear
		$response = rh "`n`n Play again? (Y/N)"
		
		if ($response -eq "Y"){
			$validReply = "True"
			$status = "True"
		}
		elseif ($response -eq "N") {
			clear
			ds " `n`n Please return and play again soon."
			rh
			$validReply = "True"
			$status = "False"
		}
		else {
			clear
			ds "`n`n Invalid input. Please press Enter to try again."
			#$validReply = "False"
			rh
		}
	}
}
