class Calculator # doesn't need a class
    def main # doesn't need a function
        puts "***************************"
        puts "A SIMPLE CALCULATOR IN RUBY"
        puts "ENTER INPUTS WITHOUT SPACES"
        puts "***************************\n\n"

    while true
        print "Enter an operation (+, -, *, /) | 'q' to quit: "
        option = gets[0]
        break if option == 'q' || option == 'Q'
        print "Enter number 1 (double): "
        num_1 = gets.chomp.to_f # chomp to remove new line, to_f to parse to a float (8-byte)
        print "Enter number 2 (double): "
        num_2 = gets.chomp.to_f
        @total  # Class attribute is unecessary, didn't need a class either I just felt like showing some syntax
        case option
        when '+'
            total = num_1  + num_2 
        when '-'
            total = num_1  - num_2 
        when '*'
            total = num_1  * num_2
        when '/'
            total = num_1  / num_2
        end
        puts "The result is: #{total}"
    end
    end
end

Calculator.new.main # create a new instance of Calculator and call main
