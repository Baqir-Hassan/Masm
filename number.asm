.model small
.stack 100h
.data
pno   dw   0
cno   dw   0
ten   dw   10
nLine db   10,13,'$'
.code
main proc
  mov ax,@data
  mov ds,ax
	call getNo
	call showNo
	call showNo
  mov ah,04ch
  int 21h
main endp
include io.h
end


