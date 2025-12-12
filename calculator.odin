package main

import "core:fmt" // for println, print, printfln
import "core:os" // gives the os.stdin handle
import "core:strconv" // strings conversion parse_f64
import "core:strings" // trim_space
import "core:bufio" // buffered io for reading
import "core:io" // base io intereface: bridges os to handle bufio

main :: proc() {
	fmt.println("***************************")
	fmt.println("A SIMPLE CALCULATOR IN ODIN")
	fmt.println("***************************\n")

	reader: bufio.Reader
	/* convert stdin into odin stream -> wrap the stream into io.Reader -> initializee the buffer with input source */
	bufio.reader_init(&reader, io.to_reader(os.stream_from_handle(os.stdin)))
	defer bufio.reader_destroy(&reader) // defer schedules cleanup when scope exits (like finally)

	for {
		fmt.print("Enter an operation (+, -, *, /) | 'q' to quit: ")
		option_line, _ := bufio.reader_read_string(&reader, '\n')
		if option_line == "" do break

		option_trimmed := strings.trim_space(option_line)
		if len(option_trimmed) == 0 do continue // core dump without this line
		option := option_trimmed[0]
		
		if option == 'q' || option == 'Q' do break

		num1 := get_number(&reader, "Enter number 1 (double): ").? or_continue // continue if nil
		num2 := get_number(&reader, "Enter number 2 (double): ").? or_continue
		
		total: f64
		switch option {
			case '+': total = num1 + num2
			case '-': total = num1 - num2
			case '*': total = num1 * num2
			case '/': total = num1 / num2
			case: continue
		}
		fmt.printfln("The result is: %v", total)
	}
}

get_number :: proc(reader: ^bufio.Reader, message: string) -> Maybe(f64) {
	fmt.print(message)
	line, _ := bufio.reader_read_string(reader, '\n')
	num, ok := strconv.parse_f64(strings.trim_space(line)) // convert to double 
	if !ok do return nil // return nil if can't be converted which will continue
	return num
}
