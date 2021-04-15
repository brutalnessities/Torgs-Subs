	.data
	.equ	AL_SIZE, 12
	.equ	AL_NEXT, 0
	.equ	AL_CAP, 4
	.equ	AL_STR, 8
	.equ		
	.text
	.global	al_get

get:	stmfd	sp!, {lr}
	//r0 = array
	//r1 = index
	//r2 = list->next
	//r3 = list->storage[index]
	
	ldr	r2,[r0,r1,lsl#2] 

	cmp	r2,r1			//if(list->next < index...
	bge	endif
	
	cmp	c2,#0			//...index >= 0){
	bge	endif

	ldr	r3,[r0,r1,lsl#2]
	mov	r0,r3			//return list->storage[index];

endif:					//}
	mov	r0,#INT_MAX		//return INT_max;

return:
	ldmfd	sp!, {lr}
	mov	pc, lr