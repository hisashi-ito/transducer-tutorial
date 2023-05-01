FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04
ENV DEBIAN_FRONTEND=noninteractive
USER root

RUN apt-get update && apt-get install -y init && apt-get clean all
RUN apt update -y
RUN apt dist-upgrade -y
RUN apt autoremove -y
RUN apt-get -y update
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    gcc \
    build-essential \
    patch \
    file \
    git \
    curl \
    swig \
    nkf \
    libmecab-dev \
    locales \
    wget \
    vim \
    emacs \
    unzip \
    mlocate \
    time \
    libssl-dev
    
RUN apt-get install --reinstall -y libnss3
RUN apt-get install -y language-pack-ja-base language-pack-ja
RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
ENV PYTHONIOENCODING utf-8
RUN echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc
RUN echo "export LC_ALL=ja_JP.UTF-8" >> ~/.bashrc
RUN echo "export PYTHONIOENCODING=utf-8" >> ~/.bashrc

RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip3 install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu116

WORKDIR /home

# python lib
RUN pip3 install \
    matplotlib \
    scikit-learn \
    imblearn \
    numpy \
    tqdm \
    jupyter \
    jupyterlab
