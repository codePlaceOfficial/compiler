FROM ubuntu:20.04
# Update the repository sources list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal main restricted universe multiverse" >> /etc/apt/sources.list &&\
echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list &&\
echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list &&\        
echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-security main restricted universe multiverse"  >> /etc/apt/sources.list &&\    
apt-get update

# avoid interaction
ENV DEBIAN_FRONTEND=noninteractive

# curl git vim
RUN apt-get install -y curl &&\
apt-get install -y git &&\
apt-get install -y vim 

# copy zsh config
COPY .zshrc .

# zsh
RUN apt-get install -y zsh &&\
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&\
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions &&\
mv .zshrc ~

# c/c++
RUN apt-get install -y gcc &&\
apt-get install -y g++

# ruby
RUN apt-get install -y ruby 

# python
RUN apt-get install -y python2 &&\
apt-get install -y python3 &&\
apt-get install -y pip

# go
RUN apt-get install -y golang-go

# nodejs	
RUN apt-get install -y nodejs &&\
apt-get install -y npm 

# jdk
RUN apt-get install -y openjdk-8-jdk &&\
apt-get install -y maven 

# rust
RUN apt-get install -y rustc &&\
apt-get install -y cargo 

# php
RUN apt-get install -y php &&\
apt-get install -y composer

# r
RUN apt-get install -y r-base

# ruby
RUN apt-get install -y ruby-full

CMD ["/bin/zsh"]
LABEL maintainer="codeplaceOfficial <codeplace@yeah.net>"
LABEL version="0.2"