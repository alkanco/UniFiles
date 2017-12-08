;Rechnerarchitektur Übung 6
;Aufgabe 1
macro mov $t, $s ;t=s
	sub $t, $t, $t
	add $t, $s, $t

macro push $t, $sp ;sp = t
	sw $t, 0($sp)
	add $sp, $sp, 4

macro pop $t, $sp ;t = sp
	add $sp, $sp, 4
	lw $t, 0($sp)
	
macro mult $d, $s, $t ;d = s * t
	mult $s, $t
	mov $d, HI:LO

macro div $d, $s, $t ;d = s / t
	div $s, $t
	mov $d, LO

macro mod $d, $s, $t ;d = mod s, t
	div $s % $t
	mov $d, HI

macro not $s ;s = -s
	mov $t, -1
	mult $s, $t

macro clear $s ;s = 0
	mov $s, 0
	
macro ror $s, C ;rotate $s C times to the right
	mov $t, C
	srlv $s, $s, $t
	
macro rol $s, C ;rotate $s C times to the left
	mov $t, C
	sllv $s, $s, $t
	
macro bqt &rs, &rt, label ;if($rs > $rt) goto label
    slt $d, $rt, $rs
    mov $t, 1
    beq $d, $t, Label

macro ble $rs, $rt, label ;if($rs <= $rt) goto label
    slt $d, $rs, $rt
    mov $t, 1
    beq $d, $t, equal

    equal:
    beq $rs, $rt, Label
	

;Fragen:
;Es wird von einer RISC Architektur in Microbefehle übersetzt, um im Nachhinein Zeit zu sparen.
;Man kann sehr kurze Befehle schreiben und dabei im Hintergrund viel mehr laufen lassen.
;In einer RISC Architektur werden vom Programmierer selber diese Microbefehle verwendet.
;
;Es wird eher selten von der CISC Architektur übersetzt.
	

