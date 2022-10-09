FROM nvidia/cuda:11.6.2-cudnn8-runtime-ubuntu20.04

# Ubuntu packages
RUN apt-get update
RUN apt install -y python3 python3-pip
RUN python3 -m pip install --upgrade pip
RUN apt-get install -y python3-dev git curl 

# INSTALL CUDNN8
RUN apt-get update && apt-get install -y --no-install-recommends --allow-change-held-packages \
    libcudnn8 fonts-powerline \
    && apt-mark hold libcudnn8


RUN pip install --upgrade twine keyrings.alt pynvml fastgpu

RUN pip3 install scikit-learn fastgpu nbdev pandas transformers tensorflow-addons \
     tensorflow pymongo emoji python-dotenv plotly

RUN pip3 install --pre torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/nightly/cu117

