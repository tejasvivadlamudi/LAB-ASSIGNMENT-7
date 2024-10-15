ORG 100h           ; Origin, to specify that the program starts at 100h (COM file format)
; Prompt the user to enter the first digit
MOV DX, OFFSET msg_input1  ; Load the address of the first input message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the message
; Read the first digit from the user
MOV AH, 01h        ; Function 01h of INT 21h is used to read a character
INT 21h            ; Call DOS interrupt to get the character
SUB AL, '0'        ; Convert ASCII to integer value
MOV BL, AL         ; Store the first digit in BL
; Prompt the user to enter the second digit
MOV DX, OFFSET msg_input2  ; Load the address of the second input message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the message

; Read the second digit from the user
MOV AH, 01h        ; Function 01h of INT 21h is used to read a character
INT 21h            ; Call DOS interrupt to get the character
SUB AL, '0'        ; Convert ASCII to integer value
MOV BH, AL         ; Store the second digit in BH

; Subtract the second digit from the first digit
SUB BL, BH         ; Perform BL = BL - BH

; Convert the result to ASCII
ADD BL, '0'        ; Convert the result back to ASCII for display

; Print the message "The result of the subtraction is: "
MOV DX, OFFSET msg_output  ; Load the address of the output message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the output message

; Print the result of the subtraction
MOV DL, BL         ; Move the result to DL for display
MOV AH, 02h        ; Function 02h of INT 21h is used to print a single character
INT 21h            ; Call DOS interrupt to print the character

JMP EndProgram     ; Jump to the end of the program

EndProgram:
; Terminate the program
MOV AH, 4Ch        ; Function 4Ch of INT 21h terminates the program
INT 21h            ; Call DOS interrupt to exit

msg_input1 DB 'Enter the first digit: $'
msg_input2 DB 0Dh, 0Ah, 'Enter the second digit: $'
msg_output DB 0Dh, 0Ah, 'The result of the subtraction is: $'  ; Output message

END                ; End of program