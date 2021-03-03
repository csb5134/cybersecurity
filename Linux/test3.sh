#!/bin/bash
for file in $(ls ~/Documents/files_for_hashing/);
do
	sha256sum $file
done
