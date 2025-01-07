package main
import "fmt" // needed Println and Scanln

func main(){
  fmt.Println("***************************")
  fmt.Println(" A SIMPLE CALCULATOR IN GO ");
  fmt.Println("ENTER INPUTS WITHOUT SPACES")
  fmt.Println("***************************\n\n")

  for true {
    var option rune; // rune == char
    var line string;
    fmt.Print("Enter an operation (+, -, *, /) | 'q' to quit: "); 
    _,_= fmt.Scanln(&line); // get input but ignore both returns
    option = rune(line[0]); // get the first rune of the input
    if option == 'q' || option == 'Q'{ break }
    var num1, num2 float64; // (8-byte float == double)
    fmt.Print("Enter number 1 (double): ");
    _,_ = fmt.Scan(&num1); // dont care about errors or number of items 
    fmt.Print("Enter number 2 (double): ");
    _,_ = fmt.Scan(&num2); // dont care about errors or number of items 
    total := 0.0;
    
    switch option{
    case '+':
      total = num1 + num2;
    case '-':
      total = num1 - num2;
    case '*':
      total = num1 * num2;
    case '/':
      total = num1 / num2;
  }
    fmt.Println("The result is:", total);
  }
}
