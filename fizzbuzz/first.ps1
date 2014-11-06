 switch (1..100)
	{
	{-not ($_ % 15)} {'FizzBuzz'; continue}
	{-not ($_ % 5)}  {'Buzz'; continue}
	{-not ($_ % 3)}  {'Fizz'; continue}
	default	  {$_}
	}
