# Program that counts consecutive 1’s given multiple lists
# Returns the highest number of 1's

.global _start
.text
_start:
	la a1, LIST # Load the memory address into a1
	addi a0, zero, 0 # Register a0 will hold the result
	jal ONES
	mv s10, a0
END:
	ebreak
ONES: 
	addi sp, sp, -4
	sw ra, 0(sp)
	addi t0, zero, -1
NEW_WORD:
	lw a2, 0(a1)
	beq a2, t0, GO_BACK
	mv a3, a2
	addi a4, zero, 0
LOOP:
	srli a2, a2, 1 # Perform SHIFT, followed by AND
	and a2, a2, a3
	addi a4, a4, 1 # Count the string lengths so far
	bnez a2, LOOP # Loop until data contains no more 1’s
			
	addi a1, a1, 4
	bgt a4, a0, UPDATE_a0
	j NEW_WORD

UPDATE_a0: 
	mv a0, a4
	j NEW_WORD

GO_BACK: 
	lw ra, 0(sp)
	addi sp, sp, 4
	jr ra

.global LIST
.data
LIST:
	.word 0x103fe00f, 100, -1
