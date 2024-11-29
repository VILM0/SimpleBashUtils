#!/bin/bash

PROG=./s21_cat
BUILD=./test/
FILE1=file1.txt
FILE2=file2.txt
filename="cat"
extension="txt"

total_tests=0
succes_tests=0
failed_tests=0

# Функция для выполнения теста
run_test() {
    local test_number=$1
    local command1=$2
    local command2=$3

    total_tests=$((total_tests + 1))
    local result_file1="${filename}${total_tests}_1.${extension}"
    local result_file2="${filename}${total_tests}_2.${extension}"

    # Выполняем команды
    $command1 > "$BUILD$result_file1"
    $command2 > "$BUILD$result_file2"

    # Сравниваем результаты
    if diff "$BUILD$result_file1" "$BUILD$result_file2" > /dev/null; then
        succes_tests=$((succes_tests + 1))
        echo "Test $total_tests success"
    else
        failed_tests=$((failed_tests + 1))
        echo "Test $total_tests failed"
    fi
    echo "---------------------------------------------------"
}

# Тест 1 без флагов
run_test 1 "cat $BUILD$FILE1" "$PROG $BUILD$FILE1"

# Тест 2 с флагом -b
run_test 2 "cat -b $BUILD$FILE1" "$PROG --number-nonblank $BUILD$FILE1"

# Тест 3 с флагом -e
run_test 3 "cat -e $BUILD$FILE1" "$PROG -e $BUILD$FILE1"

# Тест 4 с флагом -n
run_test 4 "cat -n $BUILD$FILE1" "$PROG --number $BUILD$FILE1"

# Тест 5 с флагом -n
run_test 5 "cat -s $BUILD$FILE1" "$PROG --squeeze-blank $BUILD$FILE1"

# Тест 6 с флагом -t
run_test 6 "cat -t $BUILD$FILE1" "$PROG -t $BUILD$FILE1"

# Тест 7 два файла без флагов
run_test 7 "cat $BUILD$FILE1 $BUILD$FILE2" "$PROG $BUILD$FILE1 $BUILD$FILE2"

# Тест 8 два файла с флагом -b
run_test 8 "cat -b $BUILD$FILE1 $BUILD$FILE2" "$PROG --number-nonblank $BUILD$FILE1 $BUILD$FILE2"

# Тест 9 два файла с флагом -e
run_test 9 "cat -e $BUILD$FILE1 $BUILD$FILE2" "$PROG -e $BUILD$FILE1 $BUILD$FILE2"

# Тест 10 два файла с флагом -n
run_test 10 "cat -n $BUILD$FILE1 $BUILD$FILE2" "$PROG --number $BUILD$FILE1 $BUILD$FILE2"

# Тест 11 два файла с флагом -e
run_test 11 "cat -e $BUILD$FILE1 $BUILD$FILE2" "$PROG -e $BUILD$FILE1 $BUILD$FILE2"

# Тест 12 два файла с флагом -t
run_test 12 "cat -t $BUILD$FILE1 $BUILD$FILE2" "$PROG -t $BUILD$FILE1 $BUILD$FILE2"

# Вывод результатов
echo "Total tests: $total_tests"
echo "Successful tests: $succes_tests"
echo "Failed tests: $failed_tests"

if [ $failed_tests -eq 0 ]; then
    echo "All tests success!"
    exit 0
else
    echo "Some tests failed."
    exit 1
fi
