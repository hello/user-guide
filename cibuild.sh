# download Hugo and set path
wget https://github.com/spf13/hugo/releases/download/v0.12/hugo_0.12_linux_386.tar.gz
tar -zxvf hugo_0.12_linux_386.tar.gz
cp hugo_0.12_linux_386/hugo_0.12_linux_386 hugo-ci
chmod +x hugo-ci

# download awscli and set path
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
./awscli-bundle/install -b ~/bin/aws

#!/bin/bash
if [ $TRAVIS_BRANCH == 'staging' ]; then
	echo "Clear all existing content in s3 bucket"
	/home/travis/bin/aws s3 rm s3://staging-user.hello.is/ --recursive
	
	echo
	head -1 config.toml
	echo

	echo "Invoke hugo to build /public and log"
	./hugo-ci --logFile="hugo-log"

	if grep -q ERROR "hugo-log" || grep -q CRITICAL "hugo-log"; then 
		echo "\n Hugo has failed to generate content \n"
	else
		echo "copy 404 page to error page"
		cp public/404.html public/error.html

		echo "run awscli s3 command to upload /public to staging bucket for internal testing"
		echo "Uploading to staging s3"
		/home/travis/bin/aws s3 cp public/ s3://staging-user.hello.is/ --recursive
	fi
fi

if [ $TRAVIS_BRANCH == 'master' ]; then
	echo "Update master base url"
	mv config.toml config-staging.toml
	sed 's/http:\/\/staging-user.hello.is/http:\/\/guide.hello.is/g' config-staging.toml > config.toml
	find . -iregex '.*\(toml\)'

	echo
	head -1 config.toml
	echo
	
	echo "Invoke hugo to build /public and log"
	./hugo-ci --logFile="hugo-log"

	if grep -q ERROR "hugo-log" || grep -q CRITICAL "hugo-log"; then 
		echo "\n Hugo has failed to generate content \n"
	else
		echo "copy 404 page to error page"
		cp public/404.html public/error.html

		echo "run awscli s3 command to upload /public to master bucket to have it published"
		echo "Uploading to master s3"
		/home/travis/bin/aws s3 cp public/ s3://staging-user.hello.is/ --recursive
	fi
fi