;Rechnerarchitektur Übung 6
;Bearbeitet von: Nils Kerk, William Djalal
;Aufgabe 2
section .text

global strToInt

strToInt:
mov rax, 0 ;reset output value

cmp rsi, 1
jbe finish ;finish if base <= 1
cmp rsi, 36
ja finish ;finish if base > 36

calc:
movzx r8, byte [rdi] ;take from Ascii Input
inc rdi ;go to space for the next run
cmp r8, '0'
jb finish ;finish if Input is below '0'
cmp r8, '9'
ja finish ;finish if Input is above '9'

sub r8, '0' ;convert to ascii

imul rax, rsi ;multiply output value by base

add rax, r8
jmp calc ;next run

finish:
ret ;return converted number in correct base