
#wget https://github.com/spf13/hugo/releases/download/v0.12/hugo_0.12_darwin_386.zip
wget https://github.com/spf13/hugo/releases/download/v0.12/hugo_0.12_linux_386.tar.gz

unzip -o hugo_0.12_linux_386.zip

cp hugo_*/hugo_* hugo-ci
chmod +x hugo-ci

./hugo-ci
s3cmd put -r public/* s3://staging-user.hello.is/
