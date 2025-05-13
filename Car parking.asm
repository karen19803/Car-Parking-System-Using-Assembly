org 100h

.data
Entry db "Enter the amount of paid money or enter '0' if you want to leave: $"
wrongEntrymessage db "Not specified value $"
Expirymessage db "Expired... $ "

.code
mov ax, @data
mov ds, ax

Userinput:
; Display input prompt
lea dx, Entry
mov ah, 09h
int 21h

; Read user input
mov dl, 10  ; Initialize dl by 10
mov bl, 0   ; Initialize bl by 0
mov cx, 0   ; Initialize cx by 0

scanNum:
  mov ah, 01h
  int 21h

  cmp al, 13   ; Check if "ENTER" key is pressed
  je Return 

  mov ah, 0  
  sub al, 48   ; Convert ASCII to numeric value
  mov cl, al

  mov al, bl   ; bl contains the previous value
  mul dl       ; Multiply the previous value with 10
  add al, cl   ; previous * 10 + new value
  mov bl, al

  jmp scanNum

Return:
  ; Convert pounds to seconds (5 pounds = 5 minutes, 10 pounds = 30 minutes, 20 pounds = 60 minutes)
  cmp bl, 5
  je Delay5Minutes
  cmp bl, 10
  je Delay30Minutes
  cmp bl, 20
  je Delay60Minutes
  jmp wrongentry

Delay5Minutes:
  mov cx, 22500  ; Approximately 5 minutes delay (adjust as needed) 
 
  jmp Delay

Delay30Minutes:
  mov cx, 45000  ; Approximately 30 minutes delay (adjust as needed)
  jmp Delay

Delay60Minutes:
  mov cx, 65000  ; Approximately 60 minutes delay (adjust as needed)
  jmp Delay
  
Delay:
  ; Wait loop
DelayLoop:
  dec cx         ; Decrement cx (delay count)
  jnz DelayLoop  ; Jump back if delay count is not zero

  ; Display "Expired" message
  lea dx, Expirymessage
  mov ah, 09h
  int 21h

  jmp Final

wrongentry:
  cmp bl, 0
  je END

  ; Display "Wrong Entry" message
  lea dx, wrongEntrymessage
  mov ah, 09h
  int 21h

Final:
  ; Newline
  mov dx, 13
  mov ah, 2
  int 21h  
  mov dx, 10
  mov ah, 2
  int 21h
  jmp Userinput 

END:
  hlt