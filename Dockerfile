ARG CUDA_VERSION=10.2
FROM nvidia/cudagl:${CUDA_VERSION}-devel-ubuntu18.04
LABEL maintainer "yuma.hiramatsu <yuma.hiramatsu@gmail.com>"

RUN apt-get update && apt-get install -y --no-install-recommends \
    cmake \
    freeglut3-dev \
    git \
    libeigen3-dev \
    libjpeg-dev \
    libgl1-mesa-dev \
    libglew-dev \
    libsuitesparse-dev \
    libudev-dev \
    libusb-1.0-0-dev \
    libxkbcommon-x11-dev \
    openjdk-8-jdk \
    zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN git clone https://github.com/stevenlovegrove/Pangolin.git \
 && cd Pangolin \
 && mkdir build && cd build \
 && cmake .. -DAVFORMAT_INCLUDE_DIR="" \
 && cmake --build .

RUN git clone https://github.com/occipital/OpenNI2.git \
 && cd OpenNI2 \
 && make -j8

RUN ln -sf /usr/include/eigen3/Eigen /usr/include/Eigen \
 && ln -sf /usr/include/eigen3/unsupported /usr/include/unsupported

RUN git clone https://github.com/mp3guy/ElasticFusion.git \
 && cd ElasticFusion/Core \
 && mkdir build && cd build && cmake ../src && make -j8 \
 && cd ../../GUI \
 && mkdir build && cd build && cmake ../src && make -j8

WORKDIR /workspace