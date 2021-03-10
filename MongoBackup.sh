#!/bin/bash

TIMESTAMP=`date +%F-%H%M`
S3_BUCKET_NAME="<Bucket name>"
mongodump -d <Database Name> -u <Username> -p <password>
mv dump mongodb-$HOSTNAME-$TIMESTAMP
aws s3 cp mongodb-$HOSTNAME-$TIMESTAMP s3://<bucketname or path> --recursive
rm -rf mongodb-*