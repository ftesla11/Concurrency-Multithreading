#!/bin/bash
chmod +x file
for run in {1..10}
do
	bin/ndfs.sh input/bench-deep.sumo seq 1
done
echo "Test seq - Bench Deep"