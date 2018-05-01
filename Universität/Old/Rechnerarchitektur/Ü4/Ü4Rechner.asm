section .text

global formula

;Bearbeitet von: Nils Kerk, William Djalal

formula:
	ADD edi, esi ;(a+b)
	SUB edx, ecx ;(c-d)
	MOV eax, 0
	MOV eax, edx
	MOV edx, 0
    IMUL edi ;(a+b)*(c-d) = t1
	MOV edi, eax
	MOV eax, 0

	MOV eax, r8d
	MOV r8d, 0
	MOV r8d, 8
	MOV edx, 0
	IMUL r8d ;e*8
	MOV r8d, eax
	MOV eax, 0
	
	MOV eax, r9d
	MOV r9d, 0
	MOV r9d, 4
	MOV edx, 0
	IMUL r9d ;f*4
	MOV r9d, eax
	MOV eax, 0
	
	MOV esi, [rsp+8] ;Stack g
	MOV ecx, [rsp+16] ;Stack h
	
	MOV eax, esi
	MOV esi, 0
	MOV esi, 2
	MOV edx, 0
	CDQ
	IDIV esi ;g/2
	MOV esi, eax
	MOV eax, 0
	
	MOV eax, ecx
	MOV ecx, 0
	MOV ecx, 4
	MOV edx, 0
	CDQ
	IDIV ecx ;h/4
	MOV ecx, eax
	MOV eax, 0
	
	ADD r8d, r9d ;e+f
	
	SUB r8d, esi ;(e+f)-g
	
	ADD r8d, ecx ;((e+f)-g)+h

	MOV eax, edi
	MOV edx, 0
	IMUL r8d ;t1*t2 = t3
	
	MOV edx, 0
	MOV esi, 0
	MOV esi, 3
	CDQ
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