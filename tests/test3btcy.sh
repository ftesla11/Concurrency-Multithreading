#!/bin/bash
chmod +x file
for run in {1..10}
do
	bin/ndfs.sh input/bintree-cycle.prom 3_naive 1
done
echo "Test 3 - bintreeCycle- 1 threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree-cycle.prom 3_naive 5
done
echo "Test 3 - bintreeCycle - 5 threads"

for run in {1..10}
do
	bin/ndfs.sh input/bintree-cycle.prom 3_naive 10
done
echo "Test 3 - bintreeCycle - 10 threads"

for run in {1..10}
do
	bin/ndfs.sh input/bintree-cycle.prom 3_naive 15
done
echo "Test 3 - bintreeCycle - 15 threads"

for run in {1..10}
do
	bin/ndfs.sh input/bintree-cycle.prom 3_naive 20
done
echo "Test 3 - bintreeCycle - 20 threads"
for run in {1..10}
do
	bin/ndfs.sh input/bintree-cycle.prom 3_naive 25
done
echo "Test 3 - bintreeCycle - 25 threads"



