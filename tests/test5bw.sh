#!/bin/bash
chmod +x file
for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 5_naive 1
done
echo "Test 5 - benchWide - 1 thread"
for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 5_naive 5
done
echo "Test 5 - benchWide - 5 thread"

for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 5_naive 10
done
echo "Test 5 - benchWide - 10 thread"

for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 5_naive 15
done
echo "Test 5 - benchWide - 15 thread"

for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 5_naive 20
done
echo "Test 5 - benchWide - 20 thread"

for run in {1..10}
do
	bin/ndfs.sh input/bench-wide.sumo 5_naive 25
done
echo "Test 5 - benchWide - 25 thread"