# Определяем переменные
CC = gcc
CFLAGS = -g -O0

# Директории
ODIR = ../obj
SDIR = .

# Находим все исходные файлы .c в директории tests
CSRC = $(shell find $(SDIR) -name "*.c")
# Определяем объектные файлы
OBJ = $(patsubst %.c, $(ODIR)/%.o, $(CSRC))

# Основная цель
all: $(OBJ)

# Правило для компиляции .c файлов в .o
$(ODIR)/%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	@rm -rf $(ODIR)/
