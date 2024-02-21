#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 6 ]; then
    echo "Usage: $0 <test1.txt> <test2.txt> <test3.txt> <test4.txt> <test5.txt> <test6.txt>"
    exit 1
fi

# Define input files for each set of commands
file1="test/$1"
file2="test/$2"
file3="test/$3"
file4="test/$4"
file5="test/$5"
file6="test/$6"

# Check if the input files exist
for file in "$file1" "$file2" "$file3" "$file4" "$file5" "$file6"; do
    if [ ! -f "$file" ]; then
        echo "Error: Input file '$file' not found."
        exit 1
    fi
done

# Use input files provided as arguments
echo " >> file 1: Shuffle 500 numbers from -1000 to 100000 and memory leaks"
./push_swap $(< "$file1") | ./test/checker_linux $(< "$file1") 
valgrind --leak-check=full ./push_swap $(< "$file1") | wc -l

echo " >> file 2: Shuffle 500 numbers from -1000 to 100000 mit MAX INT (change >MAX INT to see error handling)"
./push_swap $(< "$file2") | ./test/checker_linux $(< "$file2")
valgrind --leak-check=full ./push_swap $(< "$file2") | wc -l

echo " >> file 3: with invalid input: 0 one 2 3 |wc -l"
./push_swap $(< "$file3") | wc -l

echo " >> file 4: with ./push_swap $ARG | ./test/checker_linux $ARG"
./push_swap $(< "$file4") | ./test/checker_linux $(< "$file4")

echo " >> file 5: test with invalid input"
./push_swap $(< "$file5")

echo " >> file 6: test with invalid input"
./push_swap $(< "$file6")


