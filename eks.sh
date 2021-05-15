#!/bin/bash
`aws ec2 describe-regions --region us-east-1 --output text | cut -f4 > region.text`
region_count=$(cat region.text|wc -l)
for (( i=1; i<=$region_count; i++ ))
do
    region=$(sed -n $i'p' region.text)
    aws eks list-clusters --region $region --output text | grep - clu > /dev/null 2>&1
    if [ $? == 0 ]
    then
        echo " "
        echo -e "The cluster is in the region: \e[1;32m$region\e[0m"
        aws eks list-clusters --region $region --output text
        echo " "
    fi
done

