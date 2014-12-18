
#wget https://github.com/spf13/hugo/releases/download/v0.12/hugo_0.12_darwin_386.zip
wget https://github.com/spf13/hugo/releases/download/v0.12/hugo_0.12_linux_386.tar.gz

tar -zxvf hugo_0.12_linux_386.tar.gz

# changing path
cp hugo_0.12_linux_386/hugo_0.12_linux_386 hugo-ci
chmod +x hugo-ci

./hugo-ci
export AWS_ACCESS_KEY_ID=$access_key_id
export AWS_SECRET_KEY=$secret_access_key
export AWS_SECRET_ACCESS_KEY=$secret_access_key

s3cmd put -r public/ s3://staging-user.hello.is/
