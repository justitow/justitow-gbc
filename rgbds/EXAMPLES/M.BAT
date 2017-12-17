..\asm\gameboy\rgbasm -oirqtest.obj -iminios\include\ irqtest.asm
..\link\xlink irqtest.lnk
..\rgbfix\rgbfix -v gbirq.gb