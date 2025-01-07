import 'dart:io'; // needed for input and output operations
void main(){
    print("***************************");
    print("A SIMPLE CALCULATOR IN DART");
    print("ENTER INPUTS WITHOUT SPACES");
    print("**************************\n\n");
    
    while(true){
        stdout.write("Enter an operation (+, -, *, /) | 'q' to quit: ");
        String option = stdin.readLineSync()!.toLowerCase(); // ! means that readLineSync will not be null
        if(option == 'q') break;
        stdout.write("Enter number 1 (double): ");
        double num1 = double.parse(stdin.readLineSync()!);
        stdout.write("Enter number 2 (double): ");
        double num2 = double.parse(stdin.readLineSync()!);
        double? total; // ? means that total can be null
        
        switch(option){
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
        print("The result is: $total");
    }
}