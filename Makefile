SRCS = $(shell echo \
        ./*.c)

SRCS_ASM = $(shell echo \
        ./*.s)

OBJS = $(SRCS:.c=.o) $(SRCS_ASM:.s=.o)

CFLAGS  = -I./include -fno-builtin -I$(DEVKITPRO)/libdataplus/includ
ASFLAGS = -m4-nofpu

CXXFLAGS += $(CFLAGS)

all: libc.a       

libc.a:		$(OBJS)
	$(AR) rc $@ $(OBJS)
	-@ ($(RANLIB) $@ || true) >/dev/null 2>&1

clean: 
	find . -name "*.o" |xargs rm -f
	rm libc.a

include $(DEVKITSH4)/exword_rules