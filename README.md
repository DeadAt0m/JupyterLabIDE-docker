JupyterLab IDE container:

    - based on jupyter docker stacks(https://github.com/jupyter/docker-stacks) and can be usable inside JupyterHub or standalone.
    - includes all necessary(and little more) ML, CV and NeuroImaging libraries including(PyTorch, TensorFlow, Pyro, OpencCV, MNE, PyWavelets, etc.).
    - carefully selected extensions for JupyterLab turning it to powerfull IDE.


Requirements:

	- Docker(>=19.03.6, API>=1.40)
	- NVIDIA Container Toolkit(https://github.com/NVIDIA/nvidia-docker)
	
Getting started:

	1. Edit "env" file.
	2. Run ./build_jupyter_kernel.sh and wait(~1 hour, depends on your network speed).
	3. Run ./run_jupyter.sh  to lauch standalone instance of Jupyter Lab.


Description:

    JupyterLab container builds in two steps:
	1. Building of base image(via Dockerfile.KernelBase): Installs all reqiured system libs(and much more, I should reduce the apps list in future), launch settings(taking from jupyter docker-stacks) and miniconda. It bases on nvidia/cuda:${CUDA_VERSION}-cudnn${CUDNN_VERSION}-devel-ubuntu18.04 image. Docker image size after build ~ 7Gb.
	2. Building of main image(via Dockerfile.DLkernel): Install conda enviroment(located in ./resources/conda-env-py3.yml) and JupyterLab extensions(located inside docker file). So, you can change what you want before the build.

    You can controll build procedure (if something will go wrong) by editing build_jupyter_kernel.sh(just comment corresponding line).

    run_jupyter.sh - is example of launch of JupyterLab standalone. For using it with JupyterHub refer to docker-stacks instructions(by link above).


