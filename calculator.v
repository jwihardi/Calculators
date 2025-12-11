import os

fn main(){
	println('*****************************')
	println('  A SIMPLE CALCULATOR IN V   ')
	println('*****************************')

	for{
		print('Enter an operation (+, -, *, /) | \'q\' to quit: ')
		option := os.get_line()[0] or { continue } // indexing string gives a char

		if option == `q` || option == `Q` { break } // chars are represented with ` instead of '

		print('Enter number 1 (double): ')
		num1 := os.get_line().f64()

		print('Enter number 2 (double): ')
		num2 := os.get_line().f64()

		total := match option {
			`+` {num1 + num2}
			`-` {num1 - num2}
			`*` {num1 * num2}
			`/` {num1 / num2}
			else {0.0} // must be exhausted
		}

		println('The result is ${total}')
	}
}
