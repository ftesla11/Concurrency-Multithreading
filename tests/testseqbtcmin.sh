#!/bin/bash
chmod +x file
for run in {1..10}
do
	bin/ndfs.sh input/bintree-cycle-min.sumo seq 1
done
echo "Test seq - BT Cycle Min"