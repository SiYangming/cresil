FROM conda-builder-linux64:latest

LABEL maintainer="cresil"
LABEL description="CReSIL: Accurate Identification of Extrachromosomal Circular DNA from Long-read Sequences"
LABEL version="1.2.0"

COPY environment.yml /tmp/environment.yml

RUN conda env create -f /tmp/environment.yml && \
    conda clean -a -y && \
    rm -rf /tmp/environment.yml

WORKDIR /app

COPY . /app

RUN /opt/conda/envs/cresil/bin/pip install --no-cache-dir . && \
    rm -rf /root/.cache/pip

RUN useradd -m -u 1000 cresil && \
    chown -R cresil:cresil /app

ENV PATH=/opt/conda/envs/cresil/bin:/opt/conda/bin:$PATH
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ENTRYPOINT []

USER cresil

WORKDIR /data

CMD ["cresil", "--help"]
