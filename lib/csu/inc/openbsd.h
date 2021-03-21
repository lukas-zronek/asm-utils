/*
 * Mark as OpenBSD executable
 *
 * From:
 * https://cvsweb.openbsd.org/cgi-bin/cvsweb/~checkout~/src/lib/csu/os-note-elf.h?rev=1.5&content-type=text/plain
 */
.section ".note.openbsd.ident", "a"
	.p2align 2
	.long   8
	.long   4
	.long   1
	.asciz "OpenBSD"
	.long   0
	.previous
