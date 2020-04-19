mailstation_init:
	ld	a, (06)
	ld	(startup_slot4000device), a
	ld	a, (05)
	ld	(startup_slot4000page), a

	; check version for setting shadow vars
	ld	a, 0
	ld	(_firmwareversionsafe), a	; safe for now
	ld	a, (0x0037)
	cp	02			; check major version for v2
	jr	z, version2checkminor
	cp	03			; check major version for v3
	jr	z, version3checkminor
	jr	use_defaultversion2	; if neither major v2 or v3, who knows!  use v2.53
version2checkminor:
	ld	a, (0x0036)
	cp	53		; check for v2.53
	jr	z, use_version253
	cp	54		; check for v2.54
	jr	z, use_version254
	nop				; else use v2.53 anyway for now
use_defaultversion2:
	ld	a, 02
	ld	(_firmwareversionsafe), a	; not safe firmware in use
use_version253:
	ld	hl, 0xdba1		; set shadow vars
	ld	(_p2shadow), hl
	ld	hl, 0xdba2
	ld	(_p3shadow), hl
	jr	versioncheckcomplete
use_version254:
	ld	hl, 0xdba2		; set shadow vars
	ld	(_p2shadow), hl
	ld	hl, 0xdba3
	ld	(_p3shadow), hl
	jr	versioncheckcomplete

version3checkminor:
	ld	a, (0x0036)
	cp	3			; check for v3.03
	jr	z, use_version303
	nop				; else use v3.03 anyway for now
use_defaultversion3:
	ld	a, 3
	ld	(_firmwareversionsafe), a	; not safe firmware in use
use_version303:
	ld	hl, 0xdba5		; set shadow vars
	ld	(_p2shadow), hl
	ld	hl, 0xdba6
	ld	(_p3shadow), hl
	jr	versioncheckcomplete

versioncheckcomplete:
    ret