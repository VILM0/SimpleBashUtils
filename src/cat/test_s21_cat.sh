#!/bin/bash


PROG=./s21_cat
BUILD=./test/
FILE=r.txt


total_tests=0
succes_tests=0
failed_tests=0

# Тест 1 без ключей
total_tests=$((total_tests + 1))
cat $BUILD$FILE > $BUILD"cat1.txt"
$PROG $BUILD$FILE > $BUILD"cat2.txt"
diff $BUILD"cat1.txt" $BUILD"cat2.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 1 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 1 failed"
fi

# Тест 2 с ключом -b
total_tests=$((total_tests + 1))
cat -b $BUILD$FILE > $BUILD"cat3.txt"
$PROG -b $BUILD$FILE > $BUILD"cat4.txt"
diff $BUILD"cat3.txt" $BUILD"cat4.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 2 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 2 failed"
fi

# Тест 3 с ключом --number-nonblank
total_tests=$((total_tests + 1))
cat --number-nonblank $BUILD$FILE > $BUILD"cat5.txt"
$PROG --number-nonblank $BUILD$FILE > $BUILD"cat6.txt"
diff $BUILD"cat5.txt" $BUILD"cat6.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 3 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 3 failed"
fi

# Тест 4 с ключом -e
total_tests=$((total_tests + 1))
cat -e $BUILD$FILE > $BUILD"cat7.txt"
$PROG -e $BUILD$FILE > $BUILD"cat8.txt"
diff $BUILD"cat7.txt" $BUILD"cat8.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 4 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 4 failed"
fi

# Тест 5 с ключом -E
total_tests=$((total_tests + 1))
cat -E $BUILD$FILE > $BUILD"cat9.txt"
$PROG -E $BUILD$FILE > $BUILD"cat10.txt"
diff $BUILD"cat9.txt" $BUILD"cat10.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 5 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 5 failed"
fi

# Тест 6 с ключом -n
total_tests=$((total_tests + 1))
cat -n $BUILD$FILE > $BUILD"cat11.txt"
$PROG -n $BUILD$FILE > $BUILD"cat12.txt"
diff $BUILD"cat11.txt" $BUILD"cat12.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 6 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 6 failed"
fi

# Тест 7 с ключом --number
total_tests=$((total_tests + 1))
$PROG --number $BUILD$FILE > $BUILD"cat13.txt"
cat --number $BUILD$FILE > $BUILD"cat14.txt"
diff $BUILD"cat13.txt" $BUILD"cat14.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 7 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 7 failed"
fi

# Тест 8 с ключом -s
total_tests=$((total_tests + 1))
cat --squeeze-blank $BUILD$FILE > $BUILD"cat15.txt"
$PROG --squeeze-blank $BUILD$FILE > $BUILD"cat16.txt"
diff $BUILD"cat15.txt" $BUILD"cat16.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 8 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 8 failed"
fi

# Тест 9 с ключом --squeeze-blank
total_tests=$((total_tests + 1))
$PROG --squeeze-blank $BUILD$FILE > $BUILD"cat17.txt"
cat -s $BUILD$FILE > $BUILD"cat18.txt"
diff $BUILD"cat17.txt" $BUILD"cat18.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 9 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 9 failed"
fi

# Тест 10 с ключом -t
total_tests=$((total_tests + 1))
cat -t $BUILD$FILE > $BUILD"cat19.txt"
$PROG -t $BUILD$FILE > $BUILD"cat20.txt"
diff $BUILD"cat19.txt" $BUILD"cat20.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 10 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 10 failed"
fi

# Тест 11 с ключом -T
total_tests=$((total_tests + 1))
cat -T $BUILD$FILE > $BUILD"cat21.txt"
$PROG -T $BUILD$FILE > $BUILD"cat22.txt"
diff $BUILD"cat21.txt" $BUILD"cat22.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 11 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 11 failed"
fi

# Вывод результатов
echo "Total tests: $total_tests"
echo "Succes: $succes_tests"
echo "Failed: $failed_tests"

if [ $failed_tests -eq 0 ]; then
  echo "All tests succes!"
 exit 0
esle
  echo "Some tests failed."
 exit 1
fi
