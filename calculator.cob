       IDENTIFICATION DIVISION.

      * declare the program name (required)
       PROGRAM-ID. CALCULATOR.

       DATA DIVISION.

      * where all variables are declared
       WORKING-STORAGE SECTION.

      * level 1, PIC or PICTURE (same thing), 10 digits before and after the decimal
       01 NUM1          PIC 9(10)V9(10).
       01 NUM2          PIC 9(10)V9(10).
       01 TOTAL         PIC 9(10)V9(10).

      * for properly displaying and formatting numbers
      * Z(9) supresses 9 leading zeros
      * 9 requires 1 digit to always be shown
      * . display the decimal
      * 9(2) display 2 digits after the decimal
       01 DISPLAY-RES   PIC Z(9)9.9(2).

      * operation that holds a single character
       01 OPERATION     PIC X.

      * continue flag to control the loop
       01 CONTINUE-FLAG PIC X VALUE 'Y'.
       PROCEDURE DIVISION.
       MAIN-PARAGRAPH.
           DISPLAY "****************************".
           DISPLAY "A SIMPLE CALCULATOR IN COBOL".
           DISPLAY "****************************".
           DISPLAY " ".
           PERFORM UNTIL CONTINUE-FLAG = 'Q' OR CONTINUE-FLAG = 'q'
               DISPLAY "Enter opteration (+, -, *, /) | 'q' to quit: "
               ACCEPT OPERATION
               IF OPERATION = 'Q' OR OPERATION = 'q'
                   MOVE 'Q' TO CONTINUE-FLAG
               ELSE
                   DISPLAY "Enter number 1 (double): "
                   ACCEPT NUM1
                   DISPLAY "Enter number 2 (double): "
                   ACCEPT NUM2
                   EVALUATE OPERATION
                       WHEN '+'
                           ADD NUM1 TO NUM2 GIVING TOTAL
                       WHEN '-'
                           SUBTRACT NUM2 FROM NUM1 GIVING TOTAL
                       WHEN '*'
                           MULTIPLY NUM1 BY NUM2 GIVING TOTAL
                       WHEN '/'
                           DIVIDE NUM1 BY NUM2 GIVING TOTAL
                       WHEN OTHER
                           DISPLAY "Invalid operation"
                   END-EVALUATE
                   MOVE TOTAL TO DISPLAY-RES
                   DISPLAY "The result is: " DISPLAY-RES
               END-IF
           END-PERFORM.
           STOP RUN.
