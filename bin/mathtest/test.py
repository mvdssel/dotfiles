#!/usr/local/bin/python3.3
# encoding: utf-8

a = 1.
b = a / 10.

for i in range(9):
    a = a - b

delta = 1. - a*10.
print(delta)
