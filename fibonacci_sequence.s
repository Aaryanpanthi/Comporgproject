.data               #initializing static variables
prompt:             .asciiz "Enter an integer (N >= 25): "
error_display:      .asciiz "Illegal Number! Please Write valid numbers i.e (N >= 25) \n"
fib_display:        .asciiz "Fibonacci Sequence:\n"


.text  #writing executable codes 

main:
    #loop continue until user inputs valid number
    j input_loop   #using jump instuciton to go to label input_loop

input_loop:
    #asking user to input a number 
    li $v0, 4       #loding into  register $v0 that holds system call print i.e 4 
    la $a0, prompt  #loading the address of prompt in $a0 i.e argument for system call 
    syscall         #making a system call to operating system 


    #reading the input by the user
    li $v0, 5      #code 5 = reading input, which is loaded in $v0 using li (loding immediate)
    syscall         #making system call to OS
    move $t0, $v0    # Storeing input in temp register $t0 

    #checking if number is greater than 25 or not
    bge $t0, 25, fibonacci_sequence #bge = branch on greater than or equal , if the number is greater than the immediate value 25 it will call function fibonacci_sequence

    
    # if the number is less than 25 then printing error message
    li $v0, 4   #loading print in $v0
    la $a0, error_display #loading the address of error message 
    syscall
    j input_loop #calling loop for user to input right number 


#startring fibonacci_sequence

fibonacci_sequence:
    #initilizing variable for fibonacci_sequence 
    li $t1, 0   # loading First Fibonacci number to temp register $t1
    li $t2, 1   # loading Second Fibonacci number to temp register $t2
    li $t3, 2   # loading Counter to keep track of number in fibonacci_sequence

    #printing Fibonacci messages 
    li $v0, 4               #loading print code in $v0
    la $a0, fib_display     #loading the address of displaying Fibonacci sequence
    syscall 


fibonacci_loop:
    # Printing the current Fibonacci number
    li $v0, 1       # loading 1 to  $v0 , indicating the print integer code = 1
    move $a0, $t1   # Loading  the current Fibonacci number into $a0
    syscall         # Performing the system call to print the integer in $a0


    #calclating the next fibonacci_sequence
    add $t4, $t1, $t2   # $t4 = $t1 + $t2, adding last two values to create new fibonacci number 
    move $t1, $t2       # shifing values, $t2 will be stored in $t1
    move $t2, $t4       # shifing values, $t4(NEW NUMBER) will be stored in $t2
    addi $t3, $t3, 1    # Incrementing the counter of the currect fib_display

    
    # Checking if the counter reached the value inputed by the user
    bge $t3, $t0, exit_code # if counter  >= N then go to exit command 

    # Printing a space between the  Fibonacci numbers for better Readability 
    li $v0, 11  #11 = system call for printing character 
    li $a0, 32  # ASCII code for space
    syscall

    
    j fibonacci_loop #jumping to the starting of loop  until we meet the criteria


exit_code: 
    # Exiting  the program once we reach N
    li $v0, 10  #loading system call for program exit
    syscall     ##making system call to OS and exiting
















    













