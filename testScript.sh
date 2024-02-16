#!/bin/bash

a='elephant'
b='elephant'

if [[ "$a" == "$b" ]]; then
   exit 0
else 
   exit 1
fi