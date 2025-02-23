#!/bin/sh

# Parsing absolute filepath of this script
working_dir=$(pwd)
abs_filepath=$(readlink -f $0)
abs_dirpath=$(dirname $abs_filepath)
build_dirpath=$abs_dirpath
echo "Install at build directory: $build_dirpath"

# Install Lib
cd $build_dirpath
apt update -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.22.29.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf /usr/local/aws-cli
rm -rf awscliv2.zip ./aws
ln -sf /usr/local/bin/aws /usr/bin/aws
aws --version

# Configure S3 Keys
aws_access_key_id=$1
aws_secret_access_key=$2
aws configure --profile itc set region "fra2"
aws configure --profile itc set endpoint_url "https://d4j2.fra2.idrivee2-12.com"
aws configure --profile itc set output "json"
aws configure --profile itc set aws_access_key_id "$1"
aws configure --profile itc set aws_secret_access_key "$2"

cat /root/.aws/config
cat /root/.aws/credentials
