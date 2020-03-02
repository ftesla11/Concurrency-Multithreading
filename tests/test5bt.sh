#!/bin/bash
chmod +x file
for run in {1..10}
do
	bin/ndfs.sh input/bintree.prom 5_naive 1
done
echo "Test 5 - bintree- 1 threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree.prom 5_naive 5
done
echo "Test 5 - bintree- 5 threads"

for run in {1..10}
do
	bin/ndfs.sh input/bintree.prom 5_naive 10
done
echo "Test 5 - bintree- 10 threads"

for run in {1..10}
do
	bin/ndfs.sh input/bintree.prom 5_naive 15
done
echo "Test 5 - bintree- 15 threads"

for run in {1..10}
do
	bin/ndfs.sh input/bintree.prom 5_naive 20
done
echo "Test 5 - bintree- 20 threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree.prom 5_naive 25
done
echo "Test 5 - bintree- 25 threads"



