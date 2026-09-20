FROM quay.io/bioinfortools/cresil:1.2.0

USER root

LABEL maintainer="cresil"
LABEL description="CReSIL: Accurate Identification of Extrachromosomal Circular DNA from Long-read Sequences"
LABEL version="1.2.2"

WORKDIR /app

COPY . /app

RUN /opt/conda/envs/cresil/bin/pip install --no-cache-dir . && \
    rm -rf /root/.cache/pip && \
    chown -R cresil:cresil /app

ENV PATH=/opt/conda/envs/cresil/bin:/opt/conda/bin:$PATH
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ENTRYPOINT []

USER cresil

WORKDIR /data

CMD ["cresil", "--help"]
