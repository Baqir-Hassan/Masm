.model small
.stack 100h
.data
	fnm db "New.txt", 0
	fh dw 0
	msg db "Bismillah"
.code
main proc
	mov ax, @data
	mov DS, ax
	;create a file
	mov ah, 03ch
	mov dx, offset fnm
	mov cx, 0h
	int 21h
	mov fh, ax
	;write in file
	mov ah, 40h
	mov bx, fh
	mov cx, 9
	mov dx, offset msg
	int 21h
	; close file
	mov ah, 03eh
	mov bx, fh
	int 21h
	mov ah, 04ch
	int 21h
main endp
end