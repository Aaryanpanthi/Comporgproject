.data    #initializing static variables
prompt:             .asciiz "Enter an integer (N >= 25): "
error_display:      .asciiz "Illegal Number! Please Write valid numbers i.e (N >= 25) \n"
fib_display:        .asciiz "Fibonacci Sequence:\n"


.text  #writing executable codes 

main:
    #loop continue until user inputs valid number
    j input_loop   #using jump instuciton to go to label input_loop

input_loop 
