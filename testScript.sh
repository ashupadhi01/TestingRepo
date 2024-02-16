#!/bin/bash

a='apple'
b='elephant'

if [[ "$a" == "$b" ]]; then
   exit 0
else 
   exit 1
fi