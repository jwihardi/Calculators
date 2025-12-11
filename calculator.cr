puts " ***************************"
puts "A SIMPLE CALCULATOR IN CRYSTAL"
puts " ***************************"

loop do
	print "Enter an operation (+, -, *, /) | 'q' to quit: "
	option_input = gets
	break if option_input.nil? # break if nil
	option = option_input.chomp[0]? # chomp[0] gets the first character in a string safely
	next if option.nil?
	break if option == 'q' || option == 'Q'

	print "Enter number 1 (double): "
	num1 = gets.try(&.to_f?) || next # try to convert the input to a float

	print "Enter number 2 (double): "
	num2 = gets.try(&.to_f?) || next

	total = case option
		when '+' then num1 + num2
		when '-' then num1 - num2
		when '*' then num1 * num2 
		when '/' then num1 / num2
		else next
		end
	puts "The result is #{total}"	
end
