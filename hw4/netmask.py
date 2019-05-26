#!/usr/bin/python
# -*- coding: utf-8 -*- 

#To run use python gateway.py or ./gateway.py

import sys
import re
import os

def convertToBitString(IP):
    numbers = IP.split('.')
    a = '{:08b}'.format(int(numbers[0]))
    b = '{:08b}'.format(int(numbers[1]))
    c = '{:08b}'.format(int(numbers[2]))
    d = '{:08b}'.format(int(numbers[3]))
    return (a + b + c + d)

def usable(tCIDR, tIP):
    cidr = int(tCIDR)
    IPstr = convertToBitString(tIP)
    temp = '{:032b}'.format(0)
    if IPstr[cidr:] == temp[cidr:]:
        return True
    return False

def generateNetmask(tCIDR):
    cidr = int(tCIDR)
    ts = ""
    i = 0
    while i < 32:
        if cidr > 0:
            ts = ts + "1"
            cidr = cidr - 1
        else:
            ts = ts + "0"
        i = i + 1
    return (str(int(ts[0:8], 2)) + "." + str(int(ts[8:16], 2)) + "." + str(int(ts[16:24], 2)) + "." + str(int(ts[24:32], 2)))

os.system("ip route show > temp.txt")

fi = open("temp.txt", "r")

text = fi.read()

lines = text.splitlines()

words = lines[0].split()
dIP = words[2]
device = words[4]
tCIDR = "0"
addrCnt = 0
useCnt = 0

target = int(sys.argv[1])

fi.close()
fi = open("temp.txt", "r")

for line in fi:
    words = line.split()
    if words[0] != "default":
        temp = words[0].split('/')
        tIP = temp[0]
        tCIDR = temp[1]
        if int(tCIDR) == target:
            addrCnt = addrCnt + 1
            if usable(tCIDR, tIP):
                useCnt = useCnt + 1
    
netmask = generateNetmask(target)

print("addresses: " + str(addrCnt) + " usable: " + str(useCnt) + " netmask: " + netmask)
    
os.system("rm temp.txt")
