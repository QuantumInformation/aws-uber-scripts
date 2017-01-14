#!/usr/bin/env bash

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/config.sh"

# ___________________________________ EC2 ______________________________________________

#List all of your  instances that are currently stopped, and the reason for the stop
aws ec2 describe-instances --filters Name=instance-state-name,Values=stopped --region ${REGION} --output json | jq -r .Reservations[].Instances[].StateReason.Message


# ___________________________________ Iam _______________________________________________

# List users by ARN
aws iam list-users --output json | jq -r .Users[].Arn


# ___________________________________ S3 _______________________________________________
#list buckets by name
aws s3api list-buckets --query 'Buckets[].Name'
# if you want the contents
#aws s3api list-objects --bucket BUCKETNAME --output json --query "[sum(Contents[].Size), length(Contents[])]"

