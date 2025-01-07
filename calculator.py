def calculator() -> None: # doesn't need a function | hint at no return
    print("***************************")
    print("SIMPLE CALCULATOR IN PYTHON")
    print("ENTER INPUT WITHOUT SPACES")
    print("***************************")

    while True:
        option = input("Enter an operation (+, -, *, /) | 'q' to quit: ")
        if option == 'q' or option == 'Q':
            break
        num_1 = (float)(input("Enter number 1 (double): "))
        num_2 = (float)(input("Enter number 2 (double): "))
        total = 0 

        match option:
            case '+':
               total = num_1 + num_2
            case '-':
                total = num_1 - num_2
            case '*':
                total = num_1 * num_2
            case '/':
                total = num_1 / num_2
        
        print("The result is", total)

calculator() # call the calculator function
