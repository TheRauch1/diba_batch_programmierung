#!/bin/bash

directory="$(pwd)/$1"

cd $directory

for i in {1..20}
do
    touch file$i
done