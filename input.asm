.model small
.stack 100h
.data

.code
main proc
mov ax,@data
mov ds,ax
inputAgain:
	mov ah,07h
	int 21h
	cmp al,13
	je endInput
	cmp al,'0'
	jl  inputAgain
	cmp al,57
	jg  inputAgain
	mov ah,02h
	mov dl,al
	int 21h
	jmp inputAgain
endInput:
mov ah,04ch
int 21h
main endp
end