input = gets.to_i
randNumber = rand(10)

if(input == randNumber)
	puts('You guessed the number!')
	exit
else
	if(input < randNumber)
		puts('The random number was higher')
	else
		puts('The random number was lower')
	end
end
