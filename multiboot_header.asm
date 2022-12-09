header_start:
  dd 0xe85250d6                 ;magic number
  dd 0                          ;protect mode code
  dd header_end - header_start  ;header length

  ; checksum
  dd 0x10000000 - (0xe85250d6 + 0 + (header_end - header_start))

  ; required end tag
  dw 0
  dw 0
  dd 8
header_end:

