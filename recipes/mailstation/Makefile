TARGET = os.bin
BASEDIR = ../..
ZASM = $(BASEDIR)/emul/zasm/zasm
KERNEL = $(BASEDIR)/kernel
APPS = $(BASEDIR)/apps
EMUL = $(BASEDIR)/emul/hw/rc2014/classic
FILES = lib/mailstation_init.asm \
		lib/mailstation_stdio.asm \

.PHONY: all
all: $(TARGET)

$(TARGET): glue.asm $(FILES)
	$(ZASM) $(KERNEL) $(APPS) lib < glue.asm > $@

$(EMUL):
	$(MAKE) -C ${@:%/classic=%}

.PHONY: emul
emul: $(EMUL) $(TARGET)
	$(EMUL) $(TARGET)
	
