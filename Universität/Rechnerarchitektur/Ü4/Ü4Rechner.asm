section .text

global formula

formula:
	ADD eax, ebx ;(a+b)
	MOV ebx, eax
	SUB ecx, edx ;(c-d)
	MOV eax, 0
	MOV eax, ecx
	MOV edx, 0
    IMUL ebx ;(a+b)*(c-d) = t1
	MOV ebx, eax
	MOV eax, 0

	MOV eax, esi
	MOV esi, 0
	MOV esi, 8
	MOV edx, 0
	IMUL esi ;e*8
	MOV esi, eax
	MOV eax, 0
	
	MOV eax, edi
	MOV edi, 0
	MOV edi, 4
	MOV edx, 0
	IMUL edi ;f*4
	MOV edi, eax
	MOV eax, 0
	
	MOV r8d, [rsp+8] ;Stack g
	MOV r9d, [rsp+16] ;Stack h
	
	MOV eax, 2
	MOV edx, 0
	IDIV r8d ;g/2
	MOV r8d, eax
	MOV eax, 0
	
	MOV eax, 4
	MOV edx, 0
	IDIV r9d ;h/4
	MOV r9d, eax
	MOV eax, 0
	
	ADD esi, edi ;e+f
	
	SUB esi, r8d ;(e+f)-g
	
	ADD esi, r9d ;((e+f)-g)+h

	MOV eax, esi
	MOV esi, 0
	MOV esi, ebx
	MOV edx, 0
	IMUL ebx ;t1*t2 = t3
	
	MOV edx, 0
	MOV esi, 0
	MOV esi, 3
	IDIV esi ;t/3
	ret
	
	
;Aufgabe 2:
;1.
;Durch die begrenzte Anzahl an Registern, werden die Parameter g und h im Stack gespeichert.
;Wenn ich mit rsp 8Bits weiter gehe, treffe ich auf den ersten Parameter, und zwar g.
;Der zweite Parameter h liegt 8 Bits weiter im Stack. Und mit dem Befehl MOV kopiere ich die Werte der Parameter aus dem Stack.
;2.
;Wenn eine Zahl dividiert wird, wird das Ergebnis in eax und der Rest in edx gespeichert.
;Damit das Ergebnis nicht durch z.B. Kommazahlen verfälscht werden soll, muss vor der Verwendung
;von DIV das Register edx mit "MOV edx,0" geleert werden.