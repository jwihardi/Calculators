use std::io::{self, Write}; // needed for io::stdin() and io::stdout()

fn main(){
    println!("***************************");
    println!("A SIMPLE CALCULATOR IN RUST");
    println!("ENTER INPUTS WITHOUT SPACES");
    println!("***************************\n\n");

    loop{
        print!("Enter an operation (+, -, *, /) | 'q' to quit: "); 
        io::stdout().flush().unwrap(); 
        let mut input = String::new();
        let _ = io::stdin().read_line(&mut input); // get input but ignore return with '_'
        let option = input.chars().next(); // returns Option<T> of the first char of the input
        if option == Some('q') || option == Some('Q') { break; } // Use Some() since it can contain None
       
        print!("Enter number 1 (double): "); 
        io::stdout().flush().unwrap(); 
        let mut input = String::new();
        let _ = io::stdin().read_line(&mut input);
        let num_1: f64 = input.trim().parse().unwrap(); // convert input to f64 (8-byte float = double) 
        print!("Enter number 2 (double): "); 
        io::stdout().flush().unwrap(); 
        let mut input = String::new();
        let _ = io::stdin().read_line(&mut input);
        let num_2: f64 = input.trim().parse().unwrap();
        let mut total: f64 = 0.0;
        
        match option {
            Some('+') => total = num_1 + num_2,
            Some('-') => total = num_1 - num_2,
            Some('*') => total = num_1 * num_2,
            Some('/') => total = num_1 / num_2,
            _ => { // if option is not valid then continue
                continue;
            }
        }
        println!("The answer is: {}", total);
    }
}
