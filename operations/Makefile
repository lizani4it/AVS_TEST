OBJ_DIRECTORY_NAME = obj

CSRC = $(shell find ./ -name "*.c")
OBJ = $(patsubst %.c, $(OBJ_DIRECTORY_NAME)/%.o, $(CSRC))

all: $(OBJ_DIRECTORY_NAME) $(OBJ)

$(OBJ_DIRECTORY_NAME):
    @ mkdir -p $@

$(OBJ_DIRECTORY_NAME)/%.o: %.c
    @ $(CC) $(CFLAGS) -c $< -o $@

.PHONY: all clean
clean:
    @ rm -rf $(OBJ_DIRECTORY_NAME)/
    @ rm -f *.out
