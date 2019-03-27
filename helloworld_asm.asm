; 
; FILENAME:     helloworld_asm.asm
; CREATED BY:   Brian Hart
; DATE:         13 Nov 2018
; PURPOSE:      To say 'Hello, world' to the user
;

section .text                           ; program instructions here
    global _start                       ; must be declared for linker (ld)
   
_start:
    mov eax,4                           ; system call number (sys_write)
    mov ebx,1                           ; file descriptor for STDOUT
    mov ecx,msg                         ; const char* buffer (pointer to msg)
    mov edx,len                         ; count of chars to output
    int 0x80                            ; call kernel
 
    mov eax,1                           ; system call number (sys_exit)
    mov ebx,0                           ; process exit code
    int 0x80                            ; call kernel
    
section .data                           ; static data
    msg db  'Hello, world!',0xA,0x0     ; String to be printed
    len equ $-msg                       ; Length of the string
