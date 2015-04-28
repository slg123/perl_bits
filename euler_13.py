#!/usr/bin/python

with open( "bignums", "r" ) as f:
    lines = [ l.strip() for l in f.readlines() ]

sum = 0
for l in lines:
    i = int(l)
    sum += i

j = str(sum)
print j[:10]
