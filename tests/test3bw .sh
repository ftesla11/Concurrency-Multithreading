#!/bin/bash
chmod +x file
for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 3_naive 1
done
echo "Test 3 - benchWide - 1 thread"
for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 3_naive 5
done
echo "Test 3 - benchWide - 5 thread"

for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 3_naive 10
done
echo "Test 3 - benchWide - 10 thread"

for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 3_naive 15
done
echo "Test 3 - benchWide - 15 thread"

for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 3_naive 20
done
echo "Test 3 - benchWide - 20 thread"

for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 3_naive 25
done
echo "Test 3 - benchWide - 25 thread"