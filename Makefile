export ROOT_DIRECTORY = ${shell pwd}

export CC = gcc
export CFLAGS = -g -O0 -I ${ROOT_DIRECTORY}

OBJ_DIR := obj
BIN_DIR := bin

CSRC = $(shell find ./ -name "*.c")
OBJS = $(patsubst %.c, %.o, $(CSRC))

TARGET := $(BIN_DIR)/app
TEST_TARGET := $(BIN_DIR)/test

all: clean obj test execute

dirs:
	@mkdir -p $(BIN_DIR)
	@mkdir -p $(OBJ_DIR)

%.o: %.c
	@ $(CC) $(CFLAGS) -c ./$< -o $(OBJ_DIRECTORY_NAME)/$(notdir $@)

execute:
	@./main

obj:
	@$(MAKE) -C operations/
	@$(MAKE) -C tests/
	@$(CC) $(CFLAGS) -c main.c

test: obj
	@./scripts/BuildAndRunTests.sh

clean:
	@$(MAKE) -C operations/ clean
	@$(MAKE) -C tests/ clean
	@rm -rf $(OBJ_DIR) $(BIN_DIR)
	@rm -rf *.o
	@rm -rf main
