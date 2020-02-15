#!/bin/bash
export $(grep -v '^#' env | xargs -d '\n')
#build base first
docker build -t $BASE_IMAGE_NAME --build-arg MINICONDA_VERSION=$MINICONDA_VERSION --build-arg USER_NAME=$JUPYTER_USER_NAME --build-arg USER_PASSWORD=$JUPYTER_USER_PASSWORD  --build-arg TIMEZONE=$TIMEZONE --build-arg CUDA_VERSION=$CUDA_VERSION --build-arg CUDNN_VERSION=$CUDNN_VERSION --build-arg MINICONDA_MD5_HASH=$MINICONDA_MD5_HASH -f ./Dockerfile.KernelBase .
#and kernel
docker build -t $JUPYTER_DOCKER_IMAGE_NAME --build-arg BASE_IMAGE_NAME=$BASE_IMAGE_NAME -f ./Dockerfile.DLkernel .


