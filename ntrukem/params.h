#ifndef PARAMS_H
#define PARAMS_H

#define NTRU_N 701
#define NTRU_K 2 /* used in sampler */
#define NTRU_LOGQ 13
#define NTRU_Q (1 << NTRU_LOGQ)

#define NTRU_SEEDBYTES       48
#define NTRU_COINBYTES       32
#define NTRU_SHAREDKEYBYTES  32

#define NTRU_PACK_DEG (NTRU_N-1)
#define NTRU_PACK_TRINARY_BYTES    ((NTRU_PACK_DEG+4)/5)

#define NTRU_OWCPA_MSGBYTES       (NTRU_PACK_TRINARY_BYTES)
#define NTRU_OWCPA_PUBLICKEYBYTES ((NTRU_LOGQ*NTRU_PACK_DEG+7)/8)
#define NTRU_OWCPA_SECRETKEYBYTES (2*NTRU_PACK_TRINARY_BYTES)
#define NTRU_OWCPA_BYTES          ((NTRU_LOGQ*NTRU_PACK_DEG+7)/8)

#define NTRU_PUBLICKEYBYTES  (NTRU_OWCPA_PUBLICKEYBYTES)
#define NTRU_SECRETKEYBYTES  (NTRU_OWCPA_SECRETKEYBYTES +  NTRU_OWCPA_PUBLICKEYBYTES)
#define NTRU_CIPHERTEXTBYTES (NTRU_OWCPA_BYTES+NTRU_OWCPA_MSGBYTES)

#endif
