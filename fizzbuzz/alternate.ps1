 1 .. 100 |
 foreach {
 	$number = $_
 	$return = ""


 	( 3, "fizz" ), ( 5, "buzz" ), ( 7, "woof" ) |
 	foreach {
 		$value = $_[0]
 		$word = $_[1]


 		if ( -not ( $number % $value ) ) { $return += $word	}


 		$number.ToString?().ToCharArray?() |
 		foreach {
 			$char = $_


 			if ( $char -eq $value.ToString?() ) { $return += $word }
 		}
 	}


 	if ( $return -eq "" ) { $return = $number }


 	"{0,3:G}" -f "${_}" + ": $return"


 	$return
 }
