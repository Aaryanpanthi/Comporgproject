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
    syscall         #makind system call to OS