getNo proc
  push ax
  push bx
  push cx
  push dx
	mov  cno,0
	mov  pno,0
   again:
	mov ah,01h
	int 21h
	cmp al,13
	je  endInput
	sub al,48
	mov ah,0h
	mov cno,ax
	mov ax,pno
	mul ten
	add ax,cno
	mov pno,ax
	jmp again
 endInput:
  pop dx
  pop cx
  pop bx
  pop ax
  ret
  getno endp
showNo proc
  push ax
  push bx
  push cx
  push dx	
	mov ax,pno
	mov cx,0
DivAgain:
	mov dx,0h
	div ten
	push dx
	inc  cx
	cmp ax,0
	jne divAgain
 display:
	mov ah,02h
	pop dx
	add dx,48	
	int 21h
	loop display

  pop dx
  pop cx
  pop bx
  pop ax
 ret
ShowNo endp



