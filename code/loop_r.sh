#!/bin/sh

prefix="outputs_rf/fold" #to be changed to required directory during execution

for i in {1..10};
do
    Rscript --max-ppsize=500000 RangerScript.R $prefix"$i/file.csv" $prefix"$i/x_te.csv" $prefix"$i/impout.csv" $prefix"$i/predout.csv"
done
