#!/bin/zsh
export $(grep -v '^#' env | xargs -d '\n')
docker run -ti --init --gpus all --pid=host --network host -v $PATH_MOUNT_HOME_FOLDER:/home/$JUPYTER_USER_NAME/home -v /var/run/docker.sock:/var/run/docker.sock $JUPYTER_DOCKER_IMAGE_NAME jupyter lab --ip 0.0.0.0
