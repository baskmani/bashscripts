#!/bin/bash

`aws ec2 describe-regions --region us-east-1 --output text | cut -f4 > region.text`
 region_count=$(cat /Users/baskmani/Desktop/region.text|wc -l)

for (( i=1; i<=$region_count; i++ ))
    do
        region=$(sed -n $i'p' region.text)
        aws eks list-clusters --region $region --output text
    done

rm -rf region.text

