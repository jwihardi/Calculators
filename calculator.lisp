(format t "***************************~%")
(format t "A SIMPLE CALCULATOR IN LISP~%")
(format t "***************************~%")
(finish-output)
(loop
  (format t "Enter an operation (+, -, *, /) | 'q' to quit: ")
  (finish-output)
  (let ((operation (read)))
    (when (member operation '(q Q)) (return))
    (format t "Enter number 1 (double): ")
    (finish-output)
    (let ((num1 (read)))
    (format t "Enter number 2 (double): ") ; division by zero will crash the program
    (finish-output)
    (let ((num2 (read)))
    (format t "Result: ~a~%" (funcall (symbol-function operation) num1 num2)))))) ; symbol-function uses the operation value
