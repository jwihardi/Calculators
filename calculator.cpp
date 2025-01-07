#include <iostream> // needed for std::cout and std::cin

using std::cout, std::cin; // better than doing "using namespace std;"
int main(){
  cout << "**************************\n";
  cout << "A SIMPLE CALCULATOR IN C++\n";
  cout << "ENTER INPUT WITHOUT SPACES\n";
  cout << "**************************\n\n\n";

  while(true){
    cout << "Enter an operation (+, -, *, /) | 'q' to quit: ";
    char option;
    cin >> option; // get char input
    if(option == 'q' || option == 'Q') break;
    double num1, num2, total;
    cout << "Enter number 1 (double): ";
    cin >> num1; 
    cout << "Enter number 2 (double): ";
    cin >> num2;

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
    cout << "The result is " << total << "\n";
  }
  return 0;
}
