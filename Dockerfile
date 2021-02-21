# Base Images

FROM registry.cn-shanghai.aliyuncs.com/tcc-public/pytorch:1.4-cuda10.1-py3

ADD . /

WORKDIR /

RUN pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple --ignore-installed PyYAML

RUN DEBIAN_FRONTEND=noninteractive apt update -y
RUN DEBIAN_FRONTEND=noninteractive apt install libgl1-mesa-glx -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libglib2.0-0 -y
# RUN DEBIAN_FRONTEND=noninteractive apt install vim -y

CMD ["sh", "run.sh"]