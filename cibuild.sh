
#wget https://github.com/spf13/hugo/releases/download/v0.12/hugo_0.12_darwin_386.zip
wget https://github.com/spf13/hugo/releases/download/v0.12/hugo_0.12_linux_386.tar.gz

tar -zxvf hugo_0.12_linux_386.tar.gz

# changing path
cp hugo_0.12_linux_386/hugo_0.12_linux_386 hugo-ci
chmod +x hugo-ci

./hugo-ci
s3cmd --access_key=$access_key_id --secret_key=$secret_access_key put -r public/ s3://staging-user.hello.is/
