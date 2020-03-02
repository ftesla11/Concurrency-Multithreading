#!/bin/bash
chmod +x file
for run in {1..10}
do
	bin/ndfs.sh input/bintree.prom seq 1
done
echo "Test seq - Bintree"