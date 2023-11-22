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




