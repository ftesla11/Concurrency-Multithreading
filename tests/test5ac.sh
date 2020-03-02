#!/bin/bash
chmod +x file
for run in {1..10}
do
	bin/ndfs.sh input/accept-cycle.prom 5_naive 1
done
echo "Test 5 - acceptCycle - 1 threads"
for run in {1..10}
do
	bin/ndfs.sh input/accept-cycle.prom 5_naive 5
done
echo "Test 5 - acceptCycle - 5 threads"

for run in {1..10}
do
	bin/ndfs.sh input/accept-cycle.prom 5_naive 10
done
echo "Test 5 - acceptCycle - 10 threads"

for run in {1..10}
do
	bin/ndfs.sh input/accept-cycle.prom 5_naive 15
done
echo "Test 5 - acceptCycle - 15 threads"

for run in {1..10}
do
	bin/ndfs.sh input/accept-cycle.prom 5_naive 20
done
echo "Test 5 - acceptCycle - 20 threads"

for run in {1..10}
do
	bin/ndfs.sh input/accept-cycle.prom 5_naive 25
done
echo "Test 5 - acceptCycle - 25 threads"


