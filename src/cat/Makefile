TARGET = s21_cat
BASH = test_s21_cat.sh
CC = gcc

CFLAGS = -Wall -Wextra -Werror
STANDART = -std=c11
STYLE = -style=Google

.PHONY: all test check clean rebuild

all: $(TARGET)

test:
	sh $(BASH)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) $(STANDART) -o $(TARGET) $(TARGET).c

check:
	clang-format $(STYLE) -n $(TARGET).c
	valgrind --tool=memcheck --leak-check=yes ./$(TARGET)

clean:
	rm -rf $(TARGET) test/cat*

rebuild: clean all

version:
	clang-format --version