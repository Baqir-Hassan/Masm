.model small
.stack 100h
.data
msg    db "Enter string : ","$"
nline  db 10,13
ary db 50 dup('$')
.code
main proc
	mov ax,@data
	mov ds,ax
			mov ah,09h
			mov dx,offset msg
			int 21h
			mov si,offset ary
		again:
			mov ah,01h
			int 21h
			cmp al,13
			je  finish
			mov [si],al
			inc si
			jmp again
                 Finish:			
			mov ah,09h
			mov dx,offset nline
			int 21h



	mov ah,04ch
	int 21h
main endp
end