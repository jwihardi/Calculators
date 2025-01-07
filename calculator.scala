import scala.io.StdIn // needed for StdIn
import scala.util.control.Breaks.{break, breakable} // needed for breakable and break()
object calculator {
  def main(args: Array[String]): Unit = { // Unit indicated the function does not return anything
    println("****************************")
    println("A SIMPLE CALCULATOR IN SCALA")
    println("ENTER INPUTS WITHOUT SPACES")
    println("****************************\n\n")

    breakable {
      while (true) {
        print("Enter an operation (+, -, *, /) | 'q' to quit: ")
        var option: Char = StdIn.readChar()
        if (option == 'q' || option == 'Q') { break() }
        print("Enter number 1 (double): ")
        var num1 = StdIn.readDouble()
        print("Enter number 2 (double): ")
        var num2 = StdIn.readDouble()
        var total : Double = 0.0

        option match{
          case '+' => total = num1 + num2
          case '-' => total = num1 - num2
          case '*' => total = num1 * num2
          case '/' => total = num1 / num2
        }
        println(s"The result is: $total")
      }
    }
  }
}