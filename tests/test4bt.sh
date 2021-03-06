#!/bin/bash
chmod +x file
for run in {1..10}
do
	bin/ndfs.sh input/bintree.prom 4_naive 1
done
echo "Test 4 - bintree- 1 threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree.prom 4_naive 5
done
echo "Test 4 - bintree- 5 threads"

for run in {1..10}
do
	bin/ndfs.sh input/bintree.prom 4_naive 10
done
echo "Test 4 - bintree- 10 threads"

for run in {1..10}
do
	bin/ndfs.sh input/bintree.prom 4_naive 15
done
echo "Test 4 - bintree- 15 threads"

for run in {1..10}
do
	bin/ndfs.sh input/bintree.prom 4_naive 20
done
echo "Test 4 - bintree- 20 threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree.prom 4_naive 25
done
echo "Test 4 - bintree- 25 threads"



