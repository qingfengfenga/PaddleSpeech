FROM registry.baidubce.com/paddlepaddle/paddle:2.5.2-gpu-cuda12.0-cudnn8.9-trt8.6

WORKDIR /app

COPY . .

RUN pip install pytest-runner paddlespeech_ctcdecoders -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install . -i https://pypi.tuna.tsinghua.edu.cn/simple

RUN pip install opencc-python-reimplemented==0.1.6 -i https://pypi.tuna.tsinghua.edu.cn/simple

RUN wget https://paddlespeech.bj.bcebos.com/Parakeet/nltk_data.tar.gz && tar -zxvf nltk_data.tar.gz -C /root

EXPOSE 8090

CMD ${CLI_ARGS}