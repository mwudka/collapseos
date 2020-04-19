TARGET = os.bin
BASEDIR = ../..
ZASM = $(BASEDIR)/emul/zasm/zasm
KERNEL = $(BASEDIR)/kernel
APPS = $(BASEDIR)/apps
EMUL = $(BASEDIR)/emul/hw/rc2014/classic

.PHONY: all
all: $(TARGET)
$(TARGET): glue.asm
	$(ZASM) $(KERNEL) $(APPS) lib < glue.asm > $@

$(EMUL):
	$(MAKE) -C ${@:%/classic=%}

.PHONY: emul
emul: $(EMUL) $(TARGET)
	$(EMUL) $(TARGET)
	
