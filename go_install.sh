#!/bin/bash -e
export GOLANG="$(curl https://golang.org/dl/|grep armv6l|grep -v beta|head -1|awk -F\> {'print $3'}|awk -F\< {'print $1'})"
wget https://golang.org/dl/$GOLANG
sudo tar -C /usr/local -xzf $GOLANG
rm $GOLANG
unset GOLANG

cat >> ~/.bashrc << 'EOF'
export GOPATH=$HOME/go
export PATH=/usr/local/go/bin:$PATH:$GOPATH/bin
EOF
rm ${archive_name}
source ~/.bashrc
