 1 .. 100 |
 % {
	$return = ""


	if ( -not ( $_ % 3 ) ) { $return += "fizz" }
	if ( -not ( $_ % 5 ) ) { $return += "buzz" }
	if ( -not ( $_ % 7 ) ) { $return += "woof" }


	if ( $return -eq "" ) { $return = $_ }


	"{0,3:G}" -f "${_}" + ": $return"


	$return
 }
