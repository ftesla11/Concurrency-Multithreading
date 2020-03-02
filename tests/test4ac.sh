#!/bin/bash
chmod +x file
for run in {1..10}
do
	bin/ndfs.sh input/accept-cycle.prom 4_naive 1
done
echo "Test 4 - acceptCycle - 1 threads"
for run in {1..10}
do
	bin/ndfs.sh input/accept-cycle.prom 4_naive 5
done
echo "Test 4 - acceptCycle - 5 threads"

for run in {1..10}
do
	bin/ndfs.sh input/accept-cycle.prom 4_naive 10
done
echo "Test 4 - acceptCycle - 10 threads"

for run in {1..10}
do
	bin/ndfs.sh input/accept-cycle.prom 4_naive 15
done
echo "Test 4 - acceptCycle - 15 threads"

for run in {1..10}
do
	bin/ndfs.sh input/accept-cycle.prom 4_naive 20
done
echo "Test 4 - acceptCycle - 20 threads"

for run in {1..10}
do
	bin/ndfs.sh input/accept-cycle.prom 4_naive 25
done
echo "Test 4 - acceptCycle - 25 threads"


