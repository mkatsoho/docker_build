#! /usr/bin/env bash

## copy helper to 
cp docker*.sh 	../XKZEvaluation/
cp *Dockerfile 	../XKZEvaluation/
cp run_*.sh 	../XKZEvaluation/

## add logs/ folder
mkdir -p ../XKZEvaluation/logs
touch ../XKZEvaluation/logs/.gitkeep



