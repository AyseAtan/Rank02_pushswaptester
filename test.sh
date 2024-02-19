#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 5 ]; then
    echo "Usage: $0 <test1.txt> <test2.txt> <test3.txt> <test4.txt> <test5.txt>"
    exit 1
fi

# Define input files for each set of commands
test1.txt="$1"
test2.txt="$2"
test3.txt="$3"
test4.txt="$4"
test5.txt="$5"

# Check if the input files exist
for file in "$test1.txt" "$test2.txt" "$test3.txt" "$test4.txt" "$test5.txt"; do
    if [ ! -f "$file" ]; then
        echo "Error: Input file '$file' not found."
        exit 1
    fi
done


# Use input files provided as arguments
echo " >> Suffle 500 numbers from 0 to 100000"
./push_swap $(< "$test1.txt")
echo " >> with: 2 1 3 6 5 8"
./push_swap $(< "$test2.txt")
echo " >> with invalid input: 0 one 2 3 |wc -l"
./push_swap $(< "$test3.txt") |wc -l
echo " >> with 4 67 3 87 23 but ./push_swap $ARG | ./test/checker_linux $ARG"
./push_swap $(< "$test4.txt") | ./test/checker_linux $(< "$test4.txt")
echo " >> with invalid input"
./push_swap $(< "$test5.txt")
