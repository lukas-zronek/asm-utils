#ifndef _DIRENT_H_
#define _DIRENT_H_

/*
 * #define MAXNAMLEN       255
 *
 * struct dirent {
 *         ino_t           d_fileno;
 *         off_t           d_off;
 *         u_int16_t       d_reclen;
 *         u_int8_t        d_type;
 *         u_int8_t        d_namlen;
 *         char            d_name[MAXNAMLEN + 1];
 * };
 *
 */

#define DIRENT_RECLEN_OFFSET 16
#define DIRENT_NAME_OFFSET 24

#endif /* _DIRENT_H_ */
