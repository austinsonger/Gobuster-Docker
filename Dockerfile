FROM golang:latest 
# Setup gobuster
RUN go get github.com/OJ/gobuster && \
    mv /go/bin/gobuster /bin/gobuster && \
    rm -rf /go
# get content Lists
RUN apt install -y wget && \
    mkdir /seclists && \
    wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-large-directories-lowercase.txt -O /seclists/raft-large-directories-lowercase.txt && \
    wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/big.txt -O /seclists/big.txt && \
    wget https://gist.githubusercontent.com/jhaddix/b80ea67d85c13206125806f0828f4d10/raw/c81a34fe84731430741e0463eb6076129c20c4c0/content_discovery_all.txt -O /seclists/jhaddix.txt
ENTRYPOINT [ "gobuster" ]
