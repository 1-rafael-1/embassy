MEMORY
{
  /* NOTE 1 K = 1 KiBi = 1024 bytes */
  BOOTLOADER                        : ORIGIN = 0x08000000, LENGTH = 24K
  BOOTLOADER_STATE                  : ORIGIN = 0x08006000, LENGTH = 4K
  FLASH                             : ORIGIN = 0x08008000, LENGTH = 64K
  DFU                               : ORIGIN = 0x08018000, LENGTH = 68K
  SHARED_RAM                  (rwx) : ORIGIN = 0x20000000, LENGTH = 128
  RAM                         (rwx) : ORIGIN = 0x20000080, LENGTH = 32K - 128
}

__bootloader_state_start = ORIGIN(BOOTLOADER_STATE) - ORIGIN(BOOTLOADER);
__bootloader_state_end = ORIGIN(BOOTLOADER_STATE) + LENGTH(BOOTLOADER_STATE) - ORIGIN(BOOTLOADER);

__bootloader_dfu_start = ORIGIN(DFU) - ORIGIN(BOOTLOADER);
__bootloader_dfu_end = ORIGIN(DFU) + LENGTH(DFU) - ORIGIN(BOOTLOADER);

SECTIONS
{
    .shared_data :
    {
        *(.shared_data)
    } > SHARED_RAM
}
