section .text

global asm_fib_rek
global asm_fib_it

;iterativ
asm_fib_it:
	MOV rsi, 0 ;x
	MOV rdx, 1 ;y
	MOV rcx, 0 ;k
	
    jmp endwhile
	
fibLoop:
	MOV rsi, rdx ;x=y
	MOV rdx, rcx ;y=k
	ADD rsi, rdx ;x+y
	MOV rcx, rsi ;k=x+y
	DEC rdi ;n--
	
endwhile:
	CMP rdi, 0
	JA fibLoop ;while loop
	MOV rax, rcx
	ret ;return k

;rekursiv	
asm_fib_rek:
	CMP rdi, 3
	JB anker ;if (n<3)
	
	DEC rdi ;n-1
	PUSH rdi
	CALL asm_fib_rek ;rufe Funktion auf
	POP rdi
	PUSH rax
	
	DEC rdi ;n-2
	CALL asm_fib_rek ;rufe Funktion auf
	POP rsi
	
	ADD rax, rsi
	ret ;return fib(n-1) + fib(n-2)
	
	
anker: 
	MOV rax, 1
	ret ;return 1