.equ	RAMSTART	0x9C00
.equ	RAMEND		0xBFFF

.equ getkeycodefrombuffer 0x0A9A

.org 0x8000

jp start

.inc "mailstation_stdio.asm"
.inc "mailstation_init.asm"

.inc "err.h"
.inc "ascii.h"
.inc "core.asm"
.inc "str.asm"

.equ	STDIO_RAMSTART	RAMSTART
.equ	STDIO_GETC	_getchar
.equ	STDIO_PUTC	printchar
.inc "stdio.asm"

; *** BASIC ***

; RAM space used in different routines for short term processing.
.equ	SCRATCHPAD_SIZE	STDIO_BUFSIZE
.equ	SCRATCHPAD	STDIO_RAMEND
.inc "lib/util.asm"
.inc "lib/ari.asm"
.inc "lib/parse.asm"
.inc "lib/fmt.asm"
.equ	EXPR_PARSE	parseLiteralOrVar
.inc "lib/expr.asm"
.inc "basic/util.asm"
.inc "basic/parse.asm"
.inc "basic/tok.asm"
.equ	VAR_RAMSTART	SCRATCHPAD+SCRATCHPAD_SIZE
.inc "basic/var.asm"
.equ	BUF_RAMSTART	VAR_RAMEND
.inc "basic/buf.asm"
.equ	BAS_RAMSTART	BUF_RAMEND
.inc "basic/main.asm"


start:
	call mailstation_init
	call mailstation_stdio_init

	call _ClearLCD

	call	basInit
	jp	basStart
