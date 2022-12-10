BDIR = build

default: build

.PHONY: default build run clean

$(BDIR)/multiboot_header.o: multiboot_header.asm
	mkdir -p $(BDIR)
	nasm -f elf64 multiboot_header.asm -o $(BDIR)/multiboot_header.o

$(BDIR)/boot.o:	boot.asm
	mkdir -p $(BDIR)
	nasm -f elf64 boot.asm  -o $(BDIR)/boot.o

$(BDIR)/kernel.bin:	$(BDIR)/multiboot_header.o $(BDIR)/boot.o linker.ld
	x86_64-elf-ld -n -o $(BDIR)/kernel.bin -T linker.ld $(BDIR)/multiboot_header.o $(BDIR)/boot.o

$(BDIR)/os.iso: $(BDIR)/kernel.bin grub.cfg
	mkdir -p $(BDIR)/isofiles/boot/grub
	cp grub.cfg $(BDIR)/isofiles/boot/grub
	cp $(BDIR)/kernel.bin $(BDIR)/isofiles/boot/
	docker exec -it grub-centkun grub2-mkrescue -o $(BDIR)/os.iso $(BDIR)/isofiles

build: $(BDIR)/os.iso

run: $(BDIR)/os.iso
	qemu-system-x86_64 -cdrom $(BDIR)/os.iso

clean:
	rm -rf $(BDIR)

