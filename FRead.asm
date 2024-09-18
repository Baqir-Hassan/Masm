.model small
.stack 100h
.data
	fnm db "FRead.asm", 0
	fh dw 0
	msgbuf db 100 Dup('$')
.code
main proc
	mov ax, @data
	mov DS, ax
	;open a file
	mov ah, 03dh
	mov dx, offset fnm
	mov al, 0
	int 21h
	mov fh, ax
readFile:	;read from a file
	mov ah, 03fh
	mov bx, fh
	mov cx, 99
	mov dx, offset msgbuf
	int 21h
	cmp ax,0
	je  endRead
	; display file
	mov ah, 09h
	mov dx, offset msgbuf
	int 21h
	jmp readFile
endRead:
	; close file
	mov ah, 03eh
	mov bx, fh
	int 21h
	mov ah, 04ch
	int 21h
main endp
end
	