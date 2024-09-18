.model small
.stack 100h
.data
pno   dw   0
cno   dw   0
ten   dw   10
ary   dw   50  dup(0)
nLine db   10,13,'$'
.code
main proc
  mov ax,@data
  mov ds,ax
	mov si,offset ary
	mov cx,5
InputAry:
	call getNo
	mov  ax,pno
	mov  [si],ax
	add  si,2
	loop InputAry

	mov si,offset ary
	mov cx,5
OutputAry:
	mov  ax,[si]
	mov  pno,ax
	call showNo
	add  si,2
	loop outputAry
  mov ah,04ch
  int 21h
main endp
include io.h
end


