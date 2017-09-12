FROM lambci/lambda-base:build

ENV PATH=/var/lang/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LD_LIBRARY_PATH=/var/lang/lib:/lib64:/usr/lib64:/var/runtime:/var/runtime/lib:/var/task:/var/task/lib \
    AWS_EXECUTION_ENV=AWS_Lambda_nodejs6.10 \
    NODE_PATH=/var/runtime:/var/task:/var/runtime/node_modules \
    npm_config_unsafe-perm=true

RUN rm -rf /var/runtime /var/lang && \
  curl https://lambci.s3.amazonaws.com/fs/nodejs6.10.tgz | tar -zx -C /
  
# install git, so we can clone the repo
RUN yum -y install git

WORKDIR "/var/host"

COPY package.json .

RUN npm install

# install dev version
# RUN npm install
# build & test
# RUN npm run build 

# cleanup any dev dependencies
# RUN npm install --production

