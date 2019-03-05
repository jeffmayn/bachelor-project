# lots of inspiration from https://spin.atomicobject.com/2016/08/26/makefile-c-projects/

TARGET_EXEC ?= compiler

BUILD_DIR ?= build
SRC_DIRS ?= scanParse\
		symbolTable


SRCS := $(shell find $(SRC_DIRS) -name *.c)
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

CC := gcc
INC_DIRS := $(shell find $(SRC_DIRS) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

CPPFLAGS ?= $(INC_FLAGS) -MMD -MP -std=c11 -Wall -Wextra -pedantic -g

$(BUILD_DIR)/$(TARGET_EXEC): submake $(OBJS)
	$(CC) $(OBJS) -o $@ $(LDFLAGS)

# c source
$(BUILD_DIR)/%.c.o: %.c
	$(MKDIR_P) $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

#calling makefile from subfolder /scanParse to compile flex.l and parse.y
submake:
	cd scanParse && $(MAKE)

.PHONY: clean

clean:
	$(RM) -r $(BUILD_DIR)

-include $(DEPS)

MKDIR_P ?= mkdir -p
