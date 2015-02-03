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

# clear all existing content in s3 bucket
/home/travis/bin/aws s3 rm s3://staging-user.hello.is/ --recursive

# run awscli s3 command to upload /public to s3 bucket
/home/travis/bin/aws s3 cp public/ s3://staging-user.hello.is/ --recursive