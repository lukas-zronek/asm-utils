#ifndef _DIRENT_H_
#define _DIRENT_H_

/*
 * struct linux_dirent {
 *         unsigned long         d_ino;
 *         unsigned long         d_off;
 *         unsigned short        d_reclen;
 *         char                  d_name[1];
 * };
 *
 */

#define DIRENT_RECLEN_OFFSET 8
#define DIRENT_NAME_OFFSET 10

#endif /* _DIRENT_H_ */
