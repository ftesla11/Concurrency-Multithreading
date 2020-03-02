#!/bin/bash
chmod +x file
for run in {1..10}
do
	bin/ndfs.sh input/bintree-converge.prom 1_naive 1
done
echo "Test 1 - BTConverge - 1 Thread"
for run in {1..10}
do
	bin/ndfs.sh input/bintree-converge.prom 1_naive 5
done
echo "Test 1 - BTConverge - 5 threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree-converge.prom 1_naive 10
done
echo "Test 1 - BTConverge - 10  threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree-converge.prom 1_naive 15
done
echo "Test 1 - BTConverge - 15 threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree-converge.prom 1_naive 20
done
echo "Test 1 - BTConverge - 20 threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree-converge.prom 1_naive 25
done
echo "Test 1 - BTConverge - 25 threads"
