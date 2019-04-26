#Andrew Pirelli
#SID#861223915
#HW1 Python Implementation

import sys

files = sys.argv[1:]
for F in files:
    log = open(F, "r").read()
    sys.stdout.write(log)
