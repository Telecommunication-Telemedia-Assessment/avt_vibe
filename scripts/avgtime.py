#!/usr/bin/env python3
import os
import sys
import timeit

if len(sys.argv) < 2:
    print("usage: ./avgtime.py <N> <CMD>")
    sys.exit(1)

number = int(sys.argv[1])
cmd = " ".join(sys.argv[2:])
res = timeit.timeit(f"import os; os.system('{cmd}')", number=number)
#print(f"avgtime with {number} repetitions {cmd}: {res / number}s ")
import json
res = {"cmd": cmd, "avgtime": res / number}
for i, a in enumerate(sys.argv[2:]):
    res["arg_" + str(i)] = a
print(json.dumps(res))

