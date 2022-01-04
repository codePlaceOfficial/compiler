FROM ubuntu:20.04
# Update the repository sources list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal main restricted universe multiverse" >> /etc/apt/sources.list &&\
echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list &&\
echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list &&\        
echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-security main restricted universe multiverse"  >> /etc/apt/sources.list &&\    
apt update

# avoid interaction
ENV DEBIAN_FRONTEND=noninteractive

# c/c++
RUN apt-get install -y gcc &&\
apt-get install -y g++

# ruby
RUN apt-get install -y ruby 

# python
RUN apt-get install -y python2 &&\
apt-get install -y python3

# go
RUN apt-get install -y golang-go

# nodejs	
RUN apt-get install -y nodejs

# jdk
RUN apt-get install -y openjdk-8-jdk

CMD ["/bin/bash"]
LABEL maintainer="codeplaceOfficial <codeplace@yeah.net>"
LABEL version="0.1"