# A program that sums all items in a list
# -1 indicates the end of the list

.global _start
.text
_start:
	la s2, LIST
	addi s10, zero, 0
	addi s11, zero, 0
	addi t0, zero, -1
LOOP:
	lw t1, 0(s2)	
	beq t0, t1, END
	addi s2, s2, 4
	add s10, s10, t1
	addi s11, s11, 1
	j LOOP
END:
	ebreak

.global LIST
.data
LIST:
	.word 1, 2, 3, 5, 0xA, -1
  
