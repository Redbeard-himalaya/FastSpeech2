# FROM pytorch/pytorch:1.5-cuda10.1-cudnn7-runtime
FROM pytorch/pytorch:1.7.0-cuda11.0-cudnn8-runtime

WORKDIR /app
COPY hifigan/generator_LJSpeech.pth.tar.zip \
     hifigan/generator_universal.pth.tar.zip \
     hifigan

RUN apt update -yqq && \
    apt install -y build-essential zip && \
    pip install -r requirements.txt && \
    pip install gdown

# download and extract models
RUN unzip hifigan/generator_LJSpeech.pth.tar.zip -d hifigan && \
    unzip hifigan/generator_universal.pth.tar.zip -d hifigan && \
    mkdir -p output/ckpt/LJSpeech && \
    gdown -O output/ckpt/LJSpeech/900000.zip https://drive.google.com/uc?id=1BMmYuq39y3CbzVzIkgSkpn8UaKiwrUmx && \
    unzip output/ckpt/LJSpeech/900000.zip -d output/ckpt/LJSpeech && \
    rm output/ckpt/LJSpeech/900000.zip && \
    mkdir -p output/ckpt/AISHELL3 && \
    gdown -O output/ckpt/AISHELL3/600000.pth.tar https://drive.google.com/uc?id=1c8ScMhOoUDCfB0DIrSVdQwWrQf1lUjjH && \
    mkdir -p output/ckpt/LibriTTS && \
    gdown -O output/ckpt/LibriTTS/800000.pth.tar https://drive.google.com/uc?id=1MNi-53SZC_wKlyoaTvFG00zk6Oogf4yy
