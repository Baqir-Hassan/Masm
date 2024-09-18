.model small
.stack 100h
.data
userId	db 10,13,"Enter User Id : ","$"
userPs	db 10,13,"Enter Password: ","$"
UserAry	db  50	dup('$')
UserPas	db  50  Dup('$')

.code
main proc
mov ax,@data
mov ds,ax
	mov ah,09h
	mov dx,offset userId
	int 21h
	mov si,offset userAry
   again:
	mov ah,01h
	int 21h
	cmp al,13
	je  endInput
	mov [si],al
	inc  si
	jmp again
 endInput:
	mov ah,09h
	mov dx,offset userPs
	int 21h
	mov si,offset userPas
   again2:
	mov ah,07h
	int 21h
	cmp al,13
	je  endInput2
	mov [si],al
	inc  si
	mov ah,02h
	mov dl,'*'
	int 21h
	jmp again2
 endInput2:

	mov ah,09h
	mov dx,offset userAry
	int 21h

	mov ah,09h
	mov dx,offset userPas
	int 21h
mov ah,04ch
int 21h
main endp
end


