#!/bin/bash


PROG=./s21_cat
BUILD=./test/
FILE1=r.txt
FILE2=q.txt


total_tests=0
succes_tests=0
failed_tests=0

# Тест 1 без флагов
total_tests=$((total_tests + 1))
cat $BUILD$FILE1 > $BUILD"cat1.txt"
$PROG $BUILD$FILE1 > $BUILD"cat2.txt"
diff $BUILD"cat1.txt" $BUILD"cat2.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 1 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 1 failed"
fi
echo "---------------------------------------------------"
# Тест 2 с флагом -b
total_tests=$((total_tests + 1))
cat -b $BUILD$FILE1 > $BUILD"cat3.txt"
$PROG -b $BUILD$FILE1 > $BUILD"cat4.txt"
diff $BUILD"cat3.txt" $BUILD"cat4.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 2 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 2 failed"
fi
echo "---------------------------------------------------"
# Тест 3 с флагом --number-nonblank
total_tests=$((total_tests + 1))
cat -b $BUILD$FILE1 > $BUILD"cat5.txt"
$PROG --number-nonblank $BUILD$FILE1 > $BUILD"cat6.txt"
diff $BUILD"cat5.txt" $BUILD"cat6.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 3 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 3 failed"
fi
echo "---------------------------------------------------"
# Тест 4 с флагом -e
total_tests=$((total_tests + 1))
cat -e $BUILD$FILE1 > $BUILD"cat7.txt"
$PROG -e $BUILD$FILE1 > $BUILD"cat8.txt"
diff $BUILD"cat7.txt" $BUILD"cat8.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 4 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 4 failed"
fi
echo "---------------------------------------------------"
# Тест 5 с флагом -E
# total_tests=$((total_tests + 1))
# cat -e $BUILD$FILE1 > $BUILD"cat9.txt"
# $PROG -Ev $BUILD$FILE1 > $BUILD"cat10.txt"
# diff $BUILD"cat9.txt" $BUILD"cat10.txt"
# if [ $? -eq 0 ]; then
#   succes_tests=$((succes_tests + 1))
#   echo "Test 5 succes"
# else
#   failed_tests=$((failed_tests + 1))
#   echo "Test 5 failed"
# fi
# echo "---------------------------------------------------"
# Тест 6 с флагом -n
total_tests=$((total_tests + 1))
cat -n $BUILD$FILE1 > $BUILD"cat11.txt"
$PROG -n $BUILD$FILE1 > $BUILD"cat12.txt"
diff $BUILD"cat11.txt" $BUILD"cat12.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 6 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 6 failed"
fi
echo "---------------------------------------------------"
# Тест 7 с флагом --number
total_tests=$((total_tests + 1))
cat -n $BUILD$FILE1 > $BUILD"cat13.txt"
$PROG --number $BUILD$FILE1 > $BUILD"cat14.txt"
diff $BUILD"cat13.txt" $BUILD"cat14.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 7 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 7 failed"
fi
echo "---------------------------------------------------"
# Тест 8 с флагом -s
total_tests=$((total_tests + 1))
cat -s $BUILD$FILE1 > $BUILD"cat15.txt"
$PROG -s $BUILD$FILE1 > $BUILD"cat16.txt"
diff $BUILD"cat15.txt" $BUILD"cat16.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 8 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 8 failed"
fi
echo "---------------------------------------------------"
# Тест 9 с флагом --squeeze-blank
total_tests=$((total_tests + 1))
cat -s $BUILD$FILE1 > $BUILD"cat17.txt"
$PROG --squeeze-blank $BUILD$FILE1 > $BUILD"cat18.txt"
diff $BUILD"cat17.txt" $BUILD"cat18.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 9 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 9 failed"
fi
echo "---------------------------------------------------"
# Тест 10 с флагом -t
total_tests=$((total_tests + 1))
cat -t $BUILD$FILE1 > $BUILD"cat19.txt"
$PROG -t $BUILD$FILE1 > $BUILD"cat20.txt"
diff $BUILD"cat19.txt" $BUILD"cat20.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 10 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 10 failed"
fi
echo "---------------------------------------------------"
# Тест 11 с флагом -T
# total_tests=$((total_tests + 1))
# cat -t $BUILD$FILE1 > $BUILD"cat21.txt"
# $PROG -Tv $BUILD$FILE1 > $BUILD"cat22.txt"
# diff $BUILD"cat21.txt" $BUILD"cat22.txt"
# if [ $? -eq 0 ]; then
#   succes_tests=$((succes_tests + 1))
#   echo "Test 11 succes"
# else
#   failed_tests=$((failed_tests + 1))
#   echo "Test 11 failed"
# fi
# echo "---------------------------------------------------"
# Тест 12 без флагов c двумя файлами
total_tests=$((total_tests + 1))
cat $BUILD$FILE1 $BUILD$FILE2 > $BUILD"cat23.txt"
$PROG  $BUILD$FILE1 $BUILD$FILE2 > $BUILD"cat24.txt"
diff $BUILD"cat23.txt" $BUILD"cat24.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 12 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 12 failed"
fi
echo "---------------------------------------------------"
# Тест 13 с флагом -b c двумя файлами
total_tests=$((total_tests + 1))
cat -b $BUILD$FILE1 $BUILD$FILE2 > $BUILD"cat25.txt"
$PROG  -b $BUILD$FILE1 $BUILD$FILE2 > $BUILD"cat26.txt"
diff $BUILD"cat25.txt" $BUILD"cat26.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 13 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 13 failed"
fi
echo "---------------------------------------------------"
# Тест 14 с флагом --number-nonblank c двумя файлами
total_tests=$((total_tests + 1))
cat -b $BUILD$FILE1 $BUILD$FILE2 > $BUILD"cat27.txt"
$PROG  -b $BUILD$FILE1 $BUILD$FILE2 > $BUILD"cat28.txt"
diff $BUILD"cat27.txt" $BUILD"cat28.txt"
if [ $? -eq 0 ]; then
  succes_tests=$((succes_tests + 1))
  echo "Test 14 succes"
else
  failed_tests=$((failed_tests + 1))
  echo "Test 14 failed"
fi
echo "---------------------------------------------------"
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
