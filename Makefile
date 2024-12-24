export ROOT_DIRECTORY := $(shell pwd)

export CC := gcc
export CFLAGS := -g -O0 -I $(ROOT_DIRECTORY)

OBJ_DIR := obj
BIN_DIR := bin

CSRC := $(shell find ./ -name "*.c")
OBJS := $(patsubst %.c, $(OBJ_DIR)/%.o, $(CSRC))

TARGET := $(BIN_DIR)/app
TEST_TARGET := $(BIN_DIR)/test

all: clean dirs $(TARGET) $(TEST_TARGET)

dirs:
	@mkdir -p $(BIN_DIR)
	@mkdir -p $(OBJ_DIR)

$(TARGET): $(OBJS)
	@$(CC) $(CFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(OBJ_DIR)  # Убедитесь, что каталог существует
	@$(CC) $(CFLAGS) -c $< -o $@

execute: $(TARGET)
	@./$(TARGET)

obj:
	@$(MAKE) -C operations/
	@$(MAKE) -C tests/
	@$(CC) $(CFLAGS) -c main.c -o $(OBJ_DIR)/main.o

test: obj
	@./scripts/BuildAndRunTests.sh

clean:
	@$(MAKE) -C operations/ clean
	@$(MAKE) -C tests/ clean
	@rm -rf $(OBJ_DIR) $(BIN_DIR)
	@rm -f *.o
	@rm -f $(TARGET) $(TEST_TARGET)
