#!/bin/bash

#Andrew Pirelli
#SID#861223915
#HW1 Bash Implementation

for F in ${BASH_ARGV[*]} ; do
    cat "$F"
done
