#!/bin/bash
chmod +x file
for run in {1..10}
do
	bin/ndfs.sh input/bintree-loop.prom 1_naive 1
done
echo "Test 1 - bintreeLoop - 1 threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree-loop.prom 1_naive 5
done
echo "Test 1 - bintreeLoop - 5 threads"

for run in {1..10}
do
	bin/ndfs.sh input/bintree-loop.prom 1_naive 10
done
echo "Test 1 - bintreeLoop - 10 threads"

for run in {1..10}
do
	bin/ndfs.sh input/bintree-loop.prom 1_naive 15
done
echo "Test 1 - bintreeLoop - 15 threads"

for run in {1..10}
do
	bin/ndfs.sh input/bintree-loop.prom 1_naive 20
done
echo "Test 1 - bintreeLoop - 20 threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree-loop.prom 1_naive 25
done
echo "Test 1 - bintreeLoop - 25 threads"



