#!/bin/bash

`aws ec2 describe-regions --region us-east-1 --output text | cut -f4 > region.txt`
 region_count=$(cat /Users/baskmani/Desktop/region.text|wc -l)

for (( i=1; i<=$region_count; i++ ))
    do
        region=$(sed -n $i'p' region.txt)
        aws eks list-clusters --region $region --output text
    done

rm -rf region.txt

