#!/bin/bash
find /usr/src/kernels/3.10.0-957.10.1.el7.x86_64/ -name "*.h" | xargs grep "magic" | wc -l
