#!/bin/bash

a='apple'
b='ap'

if [[ "$a" == "$b" ]]; then
   exit 0
else 
   exit 1
fi