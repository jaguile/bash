#!/bin/bash

# Test d'expressions regulars

for i in {1..65}; 
    do echo $i | grep -E '^1[8-9]|[2-5][0-9]|60$';
done