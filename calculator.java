import java.util.Scanner; // needed for Scanner

class calculator{
  public static void main(String args[]){
    Scanner sc = new Scanner(System.in); // create new Scanner object for user inputs
    System.out.println("***************************");
    System.out.println(" SIMPLE CALCULATOR IN JAVA "); 
    System.out.println("ENTER INPUTS WITHOUT SPACES"); 
    System.out.println("***************************\n\n");

    while(true){                                             
      System.out.print("Enter an operation (+, -, *, /) | 'q' to quit: "); 
      char option = sc.next().charAt(0); /* get first character of string input */ 
      if(option == 'q' || option == 'Q') break;
      System.out.print("Enter number 1 (double): ");
      double num1 = sc.nextDouble();               
      System.out.print("Enter number 2 (double): ");
      double num2 = sc.nextDouble();
      double total = 0.0; /* must be initialized or won't compile */

      switch(option){
        case '+': total = num1 + num2;
        break;
        case '-': total = num1 - num2;
        break;
        case '*': total = num1 * num2;
        break;
        case '/': total = num1 / num2;
        break;
      }
      System.out.println("The result is: " + total);
    }
    sc.close(); // close the Scanner
  }
}
