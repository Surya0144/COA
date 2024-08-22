org 100h

num1 dw 1A2Bh
num2 dw 4C9Fh 
start: mov ax,num1
       add ax,num2
mov bx,ax  
;converting higher nibble
mov ax,bx
and ax,0F000h
shr ax,12
add ax,30h
cmp ax,39h
jle first_bit
add ax,7h
first_bit:mov dx,ax
          mov ah,02h
          int 21h
;converting lower nibble
mov ax,bx
and ax,0F00h
shr ax,8
add ax,30h
cmp ax,39h
jle second_bit
add ax,7h
second_bit:mov dx,ax
           mov ah,02h
           int 21h 
;3rd
mov ax,bx
and ax,00F0h
shr ax,4
add ax,30h
cmp ax,39h
jle third_bit
add ax,7h
third_bit:mov dx,ax
           mov ah,02h
           int 21h 
mov ax,bx
and ax,000Fh
add ax,30h
cmp ax,39h
jle last_bit
add ax,7h
last_bit:mov dx,ax
           mov ah,02h
           int 21h                       
ret

 
