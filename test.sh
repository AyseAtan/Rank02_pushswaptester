#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 5 ]; then
    echo "Usage: $0 <test1.txt> <test2.txt> <test3.txt> <test4.txt> <test5.txt>"
    exit 1
fi

# Define input files for each set of commands
file1="test/$1"
file2="test/$2"
file3="test/$3"
file4="test/$4"
file5="test/$5"

# Check if the input files exist
for file in "$file1" "$file2" "$file3" "$file4" "$file5"; do
    if [ ! -f "$file" ]; then
        echo "Error: Input file '$file' not found."
        exit 1
    fi
done

# Use input files provided as arguments
echo " >> Shuffle 500 numbers from 0 to 100000 |wc -l"
./push_swap $(< "$file1") |wc -l
echo " >> with: 2 1 3 6 5 8"
./push_swap $(< "$file2")
echo " >> with invalid input: 0 one 2 3 |wc -l"
./push_swap $(< "$file3") | wc -l
echo " >> with 4 67 3 87 23 but ./push_swap $ARG | ./test/checker_linux $ARG"
./push_swap $(< "$file4") | ./test/checker_linux $(< "$file4")
echo " >> with invalid input"
./push_swap $(< "$file5")
