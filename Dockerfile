#pip install torch==1.7.1+cu101 torchvision==0.8.2+cu101 torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html

# Base Images
FROM registry.cn-shanghai.aliyuncs.com/tcc-public/pytorch:1.4-cuda10.1-py3
#registry.cn-shanghai.aliyuncs.com/pai-dlc/pytorch-training:1.6.0PAI-gpu-py37-cu100-ubuntu16.04

#registry.cn-shanghai.aliyuncs.com/tcc-public/pytorch:1.4-cuda10.1-py3
ADD . /

WORKDIR /

RUN pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple

RUN DEBIAN_FRONTEND=noninteractive apt update -y
RUN DEBIAN_FRONTEND=noninteractive apt install libgl1-mesa-glx -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libglib2.0-0 -y

CMD ["sh", "run.sh"]
