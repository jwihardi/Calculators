func calculator() -> Void{ // doesn't need a function | indicate it does not return anything
    print("****************************")
    print("A SIMPLE CALCULATOR IN SWIFT")
    print("ENTER INPUTS WITHOUT SPACES")
    print("****************************\n\n")
    
    while true{
        /* set terminator equal to "", so print ends with '' instead of '\n' */
        print("Enter an operation (+, -, *, /) | 'q' to quit: ", terminator: "")
        let option = readLine()?.first
        if option == "q" || option == "Q" { break }
        print("Enter number 1 (double): ", terminator: "")
        let num1 = Double(readLine()!)! // ! means that it will not be null
        print("Enter number 2 (double): ", terminator: "")
        let num2 = Double(readLine()!)!
        var total: Double = 0.0
        
        switch option{
            case "+":
                total = num1 + num2
            case "-":
                total = num1 - num2
            case "*":
                total = num1 * num2
            case "/":
                total = num1 / num2
            default: //default since I didn't unwrap the option variable
                continue
        }
        print("The result is: \(total)")
    }
}
calculator() // call the calculator function