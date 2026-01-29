FROM sagemath/sagemath:latest

USER root

RUN apt-get update && apt-get install -y \
    make \
    gcc \
    g++ \
    libc-dev \
    wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN wget http://users.cecs.anu.edu.au/~bdm/plantri/plantri53.tar.gz \
    && tar -xzf plantri53.tar.gz \
    && cd plantri53 \
    && make \
    && cp plantri /usr/local/bin/

USER sage

WORKDIR /home/sage/project

EXPOSE 8888

CMD ["sage", "-n", "jupyter", "--ip=0.0.0.0", "--no-browser", "--NotebookApp.token=''"]
