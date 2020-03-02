#!/bin/bash
chmod +x file
for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 4_naive 1
done
echo "Test 4 - benchWide - 1 thread"
for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 4_naive 5
done
echo "Test 4 - benchWide - 5 thread"

for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 4_naive 10
done
echo "Test 4 - benchWide - 10 thread"

for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 4_naive 15
done
echo "Test 4 - benchWide - 15 thread"

for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 4_naive 20
done
echo "Test 4 - benchWide - 20 thread"

for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 4_naive 25
done
echo "Test 4 - benchWide - 25 thread"