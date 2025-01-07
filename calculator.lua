function Calculator() -- doesn't need a function
  print("***************************")
  print("A SIMPLE CALCULATOR IN LUA")
  print("ENTER INPUTS WITHOUT SPACES")
  print("***************************\n\n")

  while true do
    io.write("Enter an operation (+, -, *, /) | 'q' to quit: ")
    local option = io.read()
    if option == 'q' or option == 'Q' then
      break
    end
    io.write("Enter number 1 (double): ")
    local num_1 = tonumber(io.read())
    io.write("Enter number 2 (double): ")
    local num_2 = tonumber(io.read())
    local total

    -- Lua has no switch cases and I don't feel like implementing my own
    if option == '+' then
      total = num_1 + num_2
    elseif option == '-' then
      total = num_1 - num_2
    elseif option == '*' then
      total = num_1 * num_2
    else
      total = num_1 / num_2 -- Default is division | could've just dont if instad of else-if statements
    end
    print("The result is: " .. total)
  end
end

Calculator() -- call Calculator function
