#include <stdio.h>  /* needed for printf and scanf*/

int main(){
  printf("***************************\n");
  printf(" A SIMPLE CALCULATOR IN C  \n");
  printf("ENTER INPUTS WITHOUT SPACES\n");
  printf("***************************\n\n\n");

  while(1){   /* no booleans (1 == true) */
    /* variables must be declared at a block's head */
    char option;
    double num1, num2, total = 0;
    printf("Enter an operation (+, -, *, /) | 'q' to quit: ");
    scanf(" %c", &option);  /* scan in the char input (%c) into the address of option */
    if(option == 'q' || option == 'Q') break;
    printf("Enter number 1 (double): ");
    scanf(" %lf", &num1);   /* scan in the double input (%lf) into the address of num_1 */
    printf("Enter number 2 (double): ");
    scanf(" %lf", &num2);   /* scan in the double input (%lf) into the address of num_2 */

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
    printf("The result is: %lf\n", total);
  }
  return 0;
}
