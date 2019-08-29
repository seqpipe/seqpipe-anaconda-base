FROM amd64/ubuntu:18.04

ARG SOURCE_DIR="."

RUN apt-get update --fix-missing && \ 
	apt-get install -y build-essential gcc vim wget && \
	apt-get clean


# ANACONDA

RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh -O /anaconda.sh && \
    /bin/bash /anaconda.sh -b -p /opt/conda && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/ && \
    rm /anaconda.sh

RUN /opt/conda/bin/conda init bash

ENV PATH /opt/conda/bin:$PATH

RUN mkdir /work && mkdir /jenkins

WORKDIR /work

SHELL ["/bin/bash", "-c"]
