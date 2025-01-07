fun main(){
    println("*****************************")
    println("A SIMPLE CALCULATOR IN KOTLIN")
    println(" ENTER INPUTS WITHOUT SPACES ")
    println("*****************************\n\n")

    while(true){
        print("Enter an operation (+, -, *, /) | 'q' to quit: ")
        val option = readln().first() // get first character of string input
        if (option == 'q' || option == 'Q') break
        print("Enter number 1 (double): ")
        val num1 = readln().toDouble()
        print("Enter number 2 (double): ")
        val num2 = readln().toDouble()
        var total: Double? = null // ? indicated it can be null

        when(option){
            '+' -> total = num1 + num2
            '-' -> total = num1 - num2
            '*' -> total = num1 * num2
            '/' -> total = num1 / num2
        }
        println("The result is: $total")
    }
}