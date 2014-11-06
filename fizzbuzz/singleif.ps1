 1 .. 100 |
 foreach {
 	$number = $_
 	$return = ""


 	( 3, "fizz" ), ( 5, "buzz" ), ( 7, "woof" ) |
 	foreach {
 		if ( -not ( $number % $_[0] ) ) { $return += $_[1] }
 	}


 	if ( $return -eq "" ) { $return = $number }


 	"{0,3:G}" -f "${_}" + ": $return"


 	$return
 }
