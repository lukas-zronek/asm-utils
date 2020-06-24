/*
 * Mark as NetBSD executable
 *
 * From:
 * http://cvsweb.netbsd.org/bsdweb.cgi/~checkout~/src/lib/csu/common/sysident.S?rev=1.3&content-type=text/plain&only_with_tag=MAIN
 * http://cvsweb.netbsd.org/bsdweb.cgi/~checkout~/src/sys/sys/exec_elf.h?rev=1.160.2.2&content-type=text/plain
 */
#ifdef __NetBSD__
	.section ".note.netbsd.ident", "a"
	.p2align 2
	.long   7
	.long   4
	.long   1
	.ascii "NetBSD\0\0"
	.long 10501000
	.p2align 2
#endif
