# download Hugo and set path
wget https://github.com/spf13/hugo/releases/download/v0.12/hugo_0.12_linux_386.tar.gz
tar -zxvf hugo_0.12_linux_386.tar.gz
cp hugo_0.12_linux_386/hugo_0.12_linux_386 hugo-ci
chmod +x hugo-ci

# download awscli and set path
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
./awscli-bundle/install -b ~/bin/aws

# invoke hugo to build /public
./hugo-ci

#copy 404 page to error page
cp public/404.html public/error.html

#!/bin/bash
if [ $TRAVIS_BRANCH == 'staging' ]; then
	echo "Uploading to staging s3"
	# clear all existing content in s3 bucket
	/home/travis/bin/aws s3 rm s3://staging-user.hello.is/ --recursive
	# run awscli s3 command to upload /public to staging bucket for internal testing
	/home/travis/bin/aws s3 cp public/ s3://staging-user.hello.is/ --recursive
fi

if [ $TRAVIS_BRANCH == 'master' ]; then
	echo "Uploading to master s3"

	# Update master base url
	mv public/config.toml public/config-staging.toml
	sed 's/http:\/\/staging-user.hello.is/http:\/\/guide.hello.is/g' config-staging.toml > config.toml

	# run awscli s3 command to upload /public to master bucket to have it published
	# TODO: update bucket name correctly here
	/home/travis/bin/aws s3 cp public/ s3://staging-user.hello.is/ --recursive
fi