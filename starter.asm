org 100h
jmp start   

buffer db 512 dup(?)
buffer2 db 512 dup(?)

start:
mov ch, 00h  ;Number of track
mov cl, 01h  ;Number of sector

mov dh, 00h  ;Number of "head"
mov dl, 00h  ;Number of disk

mov ax, cs
mov es, ax

mov bx, offset buffer    
inc bx

mov ah, 02h
mov al, 01h   

int 13h 


mov ch, 00h  ;Number of track
mov cl, 01h  ;Number of sector

mov dh, 00h  ;Number of "head"
mov dl, 01h  ;Number of disk

mov ax, cs
mov es, ax

mov bx, offset buffer2    
inc bx

mov ah, 02h
mov al, 01h ;Number of sectorS 

int 13h   
       
       
mov di, 512       
len:
mov al, buffer[di]  
cmp al, 0
jnz run 
dec di
jmp len  

run:

mov si, 512       
len1:
mov al, buffer2[si]  
cmp al, 0
jnz run1 
dec si
jmp len1

run1:
clc
mov ax, si
mov bx, di
sub di, si
jc else


mov di, bx 

lp: 
jnc next
add buffer[di], 1 


next: 
cmp si, 0xFFFFh
je exit:
mov al, buffer2[si]
add al, buffer[di]
mov buffer[di], al
dec si
dec di
jmp lp





else:  
clc 


mov di, bx 

lp2: 
jnc next2
add buffer2[si], 1
next2:
cmp di, 0xFFFFh
je exit1:
mov al, buffer[di]
add al, buffer2[si]
mov buffer2[si], al
dec si
dec di
jmp lp2

 
exit1:    

mov   ch, 00h
mov   cl, 01h

mov   dh, 00h 
mov   dl, 02h 

mov   ax, cs
mov   es, ax


mov   bx, offset buffer2    


mov   ah, 03h
mov   al, 01h   

int   13h 

jmp $


        
exit:
      
mov   ch, 00h
mov   cl, 01h

mov   dh, 00h 
mov   dl, 02h 

mov   ax, cs
mov   es, ax


mov   bx, offset buffer    


mov   ah, 03h
mov   al, 01h   

int   13h
      
jmp $



ret
