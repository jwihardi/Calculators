using System; // needed for Console

namespace calculator{ // namespace not needed
    class Program{ 
        static void Main(String[] args){
            Console.WriteLine("***************************");
            Console.WriteLine("  SIMPLE CALCULATOR IN C#  ");
            Console.WriteLine("ENTER INPUTS WITHOUT SPACES");
            Console.WriteLine("***************************\n\n");

            while (true){
                Console.Write("Enter an operation (+, -, *, /) | 'q' to quit: ");
                char option = Convert.ToChar(Console.ReadLine()); // get first character of string input
                if (option == 'q' || option == 'Q') break;
                Console.Write("Enter number 1 (double): ");
                double num1 = Convert.ToDouble(Console.ReadLine());
                Console.Write("Enter number 2 (double): ");
                double num2 = Convert.ToDouble(Console.ReadLine());
                double total = 0;
                
                switch (option){
                    case '+':
                        total = num1 + num2;
                        break;
                    case '-':
                        total = num1 - num2;
                        break;
                    case '*':
                        total = num1 * num2;
                        break;
                    case '/':
                        total = num1 / num2;
                        break;
                }
                Console.WriteLine("The result is: " + total);
            }
        }
    }
}