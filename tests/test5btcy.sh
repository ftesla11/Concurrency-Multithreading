#!/bin/bash
chmod +x file
for run in {1..10}
do
	bin/ndfs.sh input/bintree-cycle.prom 5_naive 1
done
echo "Test 5 - bintreeCycle- 1 threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree-cycle.prom 5_naive 5
done
echo "Test 5 - bintreeCycle - 5 threads"

for run in {1..10}
do
	bin/ndfs.sh input/bintree-cycle.prom 5_naive 10
done
echo "Test 5 - bintreeCycle - 10 threads"

for run in {1..10}
do
	bin/ndfs.sh input/bintree-cycle.prom 5_naive 15
done
echo "Test 5 - bintreeCycle - 15 threads"

for run in {1..10}
do
	bin/ndfs.sh input/bintree-cycle.prom 5_naive 20
done
echo "Test 5 - bintreeCycle - 20 threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree-cycle.prom 5_naive 25
done
echo "Test 5 - bintreeCycle - 25 threads"



