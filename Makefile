SOURCE_FILES = src/*.asm
BINARY_FILES = $(notdir $(basename $(wildcard $(SOURCE_FILES))))
OBJECT_FILES = $(addsuffix .o, $(BINARY_FILES))

vpath %.o obj
vpath %.asm src
vpath % bin

all: $(OBJECT_FILES) $(BINARY_FILES)

%.o: %.asm
	nasm -felf64 $(basename $<).asm -o obj/$(notdir $(basename $<)).o

%: %.o
	ld obj/$(notdir $<) -o bin/$@
