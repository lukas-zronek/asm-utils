#ifndef _DIRENT_H_
#define _DIRENT_H_

/*
 * #define MAXNAMLEN       511
 *
 * struct dirent {
 *         ino_t          d_fileno;
 *         uint16_t       d_reclen;
 *         uint16_t       d_namlen;
 *         uint8_t        d_type;
 *         char           d_name[MAXNAMLEN + 1];
 * };
 *
 */

#define DIRENT_RECLEN_OFFSET 8
#define DIRENT_NAME_OFFSET 13

#endif /* _DIRENT_H_ */
