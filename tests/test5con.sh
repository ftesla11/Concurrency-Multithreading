#!/bin/bash
chmod +x file
for run in {1..10}
do
	bin/ndfs.sh input/bintree-converge.prom 5_naive 1
done
echo "Test 5 - BTConverge - 1 Thread"
for run in {1..10}
do
	bin/ndfs.sh input/bintree-converge.prom 5_naive 5
done
echo "Test 5 - BTConverge - 5 Threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree-converge.prom 5_naive 10
done
echo "Test 5 - BTConverge - 10 threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree-converge.prom 5_naive 15
done
echo "Test 5 - BTConverge - 15 Threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree-converge.prom 5_naive 20
done
echo "Test 5 - BTConverge - 20 Threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree-converge.prom 5_naive 25
done
echo "Test 5 - BTConverge - 25 Threads"
