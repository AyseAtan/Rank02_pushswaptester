#!/bin/bash

echo " >> Suffle 0 to 100000"
./push_swap $(shuf -i 0-100000 -n 500) |wc -l

echo " >> with: ARG="4 67 3 87 23"; ./push_swap $ARG | wc -l"
ARG="4 67 3 87 23"; ./push_swap $ARG | wc -l

echo " >> with ARG="4 67 3 87 23"; ./push_swap $ARG | ./test/checker_linux $ARG"
ARG="4 67 3 87 23"; ./push_swap $ARG | ./test/checker_linux $ARG

echo " >> with: ./push_swap 2 1 3 6 5 8"
./push_swap 2 1 3 6 5 8

echo " >> with invalid input: ./push_swap 0 one 2 3 |wc -l"
./push_swap 0 one 2 3 |wc -l

echo " >> with invalid input: ./push_swap 0 2 2 3"
./push_swap 0 2 2 3 
