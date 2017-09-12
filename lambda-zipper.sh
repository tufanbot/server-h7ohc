#!/usr/bin/env sh

set -e

RUN npm install

# to put the lambda.zip on host machine
cat .lambdaignore | xargs zip -9qyr /var/host/lambda.zip . -x

