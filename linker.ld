ENTRY(start)

SECTIONS {
  . = 1M;

  .boot :
  {
    /* ensure the multiboot header comes first */
    *(.multiboot_header)
  }

  .text :
  {
    *(.text)
  }
}
