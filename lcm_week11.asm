.model small
.stack 100h
.data
    num1 db 2
    num2 db 5
    gcd_res db 0
    lcm_res dw 0
    msg db 'LCM is: $'
.code
main:
    mov ax, @data
    mov ds, ax
    mov al, num1
    mov bl, num2
    call gcd
    mov gcd_res, al
    mov al, num1
    mov ah, 0
    mov dl, num2
    mul dl
    mov cl, gcd_res
    div cl
    mov lcm_res, ax
    mov ah, 09h
    lea dx, msg
    int 21h
    mov ax, lcm_res
    call print_num
    mov ah, 4Ch
    int 21h
gcd proc
    cmp bl, 0
    je end_gcd
gcd_loop:
    mov ah, 0
    div bl
    mov al, bl
    mov bl, ah
    cmp bl, 0
    jne gcd_loop
end_gcd:
    ret
gcd endp
print_num proc
    mov cx, 0
    mov bx, 10
convert_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne convert_loop
print_digits:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_digits
    ret
print_num endp
end main
