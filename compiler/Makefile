TARGET_MAIN ?= compiler
#TARGET_TEST ?= HelloTest.out

SRC_DIR_MAIN ?= main src
#SRC_DIR_TEST ?= test src

BUILD_DIR ?= build

SRC_MAIN := $(shell find $(SRC_DIR_MAIN) -name *.c & find $(SRC_DIR_MAIN) -name .y & find $(SRC_DIR_MAIN) -name .l)
#SRC_TEST :=

OBJ_MAIN := $(SRC_MAIN:%=$(BUILD_DIR)/%.o)
#OBJ_TEST :=

DEPS_MAIN := $(OBJ_MAIN:.o=.d)

GCC := gcc

INC_DIR_MAIN := $(shell find $(SRC_DIR_MAIN) -type d)#finds all subfolders in include dirs
#INC_DIR_TEST := $(shell find $(SRC_DIR_MAIN) -type d)

INC_FLAGS_MAIN := $(addprefix -I,$(INC_DIR_MAIN))
#INC_FLAGS_TEST :=$(addprefix -I,$(INC_DIR_TEST))

CFLAGS ?= -MMD -MP -std=c11 -Wall -Wextra -pedantic -g -lfl

$(BUILD_DIR)/$(TARGET_MAIN): $(OBJ_MAIN)
	$(GCC) $(OBJ_MAIN) -o $@ $(LDFLAGS)

$(BUILD_DIR)/%.c.o: %.c
		$(MKDIR_P) $(dir $@)
		$(GCC) $(INC_FLAGS_MAIN) $(CFLAGS) -c $< -o $@

parser:
	bison -y -d -v src/parser.y
	flex src/flex.l
	mv y.output src
	mv y.tab.c src
	mv y.tab.h src
	mv lex.yy.c src

.PHONY: clean

clean:
	rm -r build/*

cleanParser:
	rm src/y.output
	rm src/y.tab.c
	rm src/y.tab.h
	rm src/lex.yy.c

-include $(DEPS_MAIN)

MKDIR_P ?= mkdir -p
