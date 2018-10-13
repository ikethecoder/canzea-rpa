FROM ubuntu:16.04
MAINTAINER Fabian Stäber, fabian@fstab.de

ENV LAST_UPDATE=2016-08-21

#####################################################################################
# Current version is aws-cli/1.10.53 Python/2.7.12
#####################################################################################

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y tzdata locales

# Set the timezone
RUN echo "Europe/Berlin" | tee /etc/timezone && \
    ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Set the locale for UTF-8 support
RUN echo en_US.UTF-8 UTF-8 >> /etc/locale.gen && \
    locale-gen && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# AWS CLI needs the PYTHONIOENCODING environment varialbe to handle UTF-8 correctly:
ENV PYTHONIOENCODING=UTF-8

# man and less are needed to view 'aws <command> help'
# ssh allows us to log in to new instances
# vim is useful to write shell scripts
# python* is needed to install aws cli using pip install

RUN apt-get install -y \
    less \
    man \
    ssh \
    python \
    python-pip \
    python-virtualenv \
    vim \
    vim-nox \
    zip

# this is used by AWS polly
RUN python -m pip install --user boto3

RUN adduser --disabled-login --gecos '' aws
WORKDIR /home/aws

USER aws

RUN \
    mkdir aws && \
    virtualenv aws/env && \
    ./aws/env/bin/pip install awscli && \
    echo 'source $HOME/aws/env/bin/activate' >> .bashrc && \
    echo 'complete -C aws_completer aws' >> .bashrc

RUN pip install boto3

USER root

RUN mkdir speaking
ADD server.py /home/aws/speaking/server.py
ADD index.html /home/aws/speaking/index.html
RUN chown -R aws:aws /home/aws/speaking

USER aws
