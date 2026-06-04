#!/bin/bash

if [ "$1" -eq 1 ]; then
	cd 001_AND_Gate && sh run.sh

if [ "$1" -eq 2 ]; then
	cd 002_OR_Gate && sh run.sh
fi

