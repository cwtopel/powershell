#**************************************************************************
#
# Script Name: SeinfeldTriva.ps1 (The Seinfield Trivia Quiz)
# Version:		1.0.1
# Author:		Chris MF'n Topel
# Date:			6/9/09 - 2/20/14
#
# Descrpition: 	This PowerShell script tests the players' knowledge
#				of Seinfeld trivia though the administration of
#				a computer quiz made up of 5 questions.
#
#**************************************************************************
Set-Alias ds Write-Host
clear

$question1 = ""
$question2 = ""
$question3 = ""
$question4 = ""
$question5 = ""

$noCorrect = 0

ds "`n`n`n`n`t`t W E L C O M E  T O  T H E  S E I N F E L D"
ds "`n`n`n`t`t`t      T R I V I A  Q U I Z"
ds "`n`n`n`t`t`t      by Chris MF'n Topel"
ds "`n`n`n`n`n`n`n`n`n`n Press Enter to continue."

Read-Host
clear

ds "`n`n The Seinfeld Trivia Quiz tests your knowledge of Seinfeld`n"
ds " trivia. The quiz consists of five equally weighted multiple`n"
ds " choice questions. At the end of the quiz your answers will`n"
ds " be checked and you will be assigned a skill level, using`n"
ds " `t`t Score: 5 correct = Jerry (Expert)"
ds " `t`t Score: 4 correct = Kramer "
ds " `t`t Score: 3 correct = Elaine "
ds " `t`t Score: 2 correct = George "
ds " `t`t Score: 1 correct = Newman "
ds " `t`t Score: 0 correct = Babo (Clueless)"
ds "`n`n`n`n Press Enter to continue."

Read-Host

while (($question1 -ne "a") -and ($question1 -ne "b") -and ($question1 -ne "c") -and ($question1 -ne "d")) {
	
	clear
	
	ds
	ds " What is Kramer's first name?"
	ds
	ds " A. Peterman"
	ds " B. Cosmo"
	ds " C. Puddy"
	ds " D. Peck"
	ds
	$question1 = Read-Host " Type the letter representing the correct" `
		"answer and press the Enter key"
}

clear

while (($question2 -ne "a") -and ($question2 -ne "b") -and ($question2 -ne "c") -and ($question2 -ne "d")) {
	
	clear
	
	ds
	ds " What was George's favorite pretend career?"
	ds
	ds " A. Bra salesman"
	ds " B. Real estate"
	ds " C. City planner"
	ds " D. Architect"
	ds
	$question2 = Read-Host " Type the letter representing the correct answer and press the Enter key"
}

clear

while (($question3 -ne "a") -and ($question3 -ne "b") -and ($question3 -ne "c") -and ($question3 -ne "d")) {
	
	clear
	
	ds
	ds " For whom did Elain buy white socks?"
	ds
	ds " A. Mr. Lippman"
	ds " B. Mr. Peterman"
	ds " C. Mr. Pitt"
	ds " D. Puddy"
	ds
	$question3 = Read-Host " Type the letter representing the correct answer and press the Enter key"
}

clear

while (($question4 -ne "a") -and ($question4 -ne "b") -and ($question4 -ne "c") -and ($question4 -ne "d")) {
	
	clear
	
	ds
	ds " What is Kramer scared of?"
	ds
	ds " A. Swimming"
	ds " B. Fried Chicken"
	ds " C. Clowns"
	ds " D. The dentist"
	ds
	$question4 = Read-Host " Type the letter representing the correct answer and press the Enter key"
}

clear

while (($question5 -ne "a") -and ($question5 -ne "b") -and ($question5 -ne "c") -and ($question5 -ne "d")) {
	
	clear
	
	ds
	ds " Where do Jerry's parents live?"
	ds
	ds " A. Kansas"
	ds " B. New York"
	ds " C. California"
	ds " D. Florida"
	ds
	$question5 = Read-Host " Type the letter representing the correct answer and press the Enter key"
}

clear
ds
ds " OK, now press the Enter key to see how you did."
Read-Host
clear

if ($question1 -eq "b") { $noCorrect++ }
if ($question2 -eq "d") { $noCorrect++ }
if ($question3 -eq "c") { $noCorrect++ }
if ($question4 -eq "c") { $noCorrect++ }
if ($question5 -eq "d") { $noCorrect++ }

if ($noCorrect -eq 0) {
	ds
	ds " You did not get any questions correct."
	ds
	ds " Your knowledge of Seinfeld trivia is no better than Babo's"
}

if ($noCorrect -eq 1) {
	ds
	ds " You got 1 question correct."
	ds
	ds " Your knowledge of Seinfeld trivia is no better than" `
	"Newman's."
}

if ($noCorrect -eq 2) {
	ds
	ds " You got 2 questions correct."
	ds
	ds " Your knowledge of Seinfeld trivia is approximately that" `
		"of George's."
}

if ($noCorrect -eq 3) {
	ds
	ds " You got 3 questions correct."
	ds
	ds " You knowledge of Seinfeld trivia is approximately that" `
		"of Elaine's."
}

if ($noCorrect -eq 4) {
	ds
	ds " You got 4 questions correct."
	ds
	ds " Your knowledge of Seinfeld trivia is about as good as" `
		"Kramer's."
}

if ($noCorrect -eq 5) {
	ds
	ds " You got 5 question correct."
	ds
	ds " Your knowledge of Seinfeld trivia is every bit as good" `
		"as Jerry's."
}

Read-Host

clear
ds
ds " Thanks for taking the Seinfeld Trivia Quiz!"

Read-Host
clear
