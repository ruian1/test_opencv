FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

MAINTAINER ran4@hawk.iit.edu

RUN apt-get update && apt-get install -y binutils \
	    	      	cmake \
			dpkg-dev \
			libfftw3-dev \
			gcc \
			g++ \
			gfortran \
			git \
			libgsl0-dev \
			libjpeg-dev \
			libpng-dev \
			libx11-dev \
			libxext-dev \
			libxft-dev \
			libxml2-dev \
			libxpm-dev \
			python \
			ipython-notebook \
			python-dev \
			libssl-dev \
			libxml2-dev \
			tar \
			wget && apt-get autoremove -y && apt-get clean -y
    
# BUILD OPENCV
RUN mkdir -p /tmp/build && cd /tmp/ && \
    git clone https://github.com/Itseez/opencv source && cd source && \
    git checkout 3.2.0 && cd /tmp/build && \
    cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DENABLE_PRECOMPILED_HEADERS=OFF /tmp/source && \
    make -j4 && make install -j4 && \
    rm -r /tmp/build && rm -r /tmp/source
    