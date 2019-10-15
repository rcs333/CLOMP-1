FROM ubuntu:18.04

RUN apt update && \
    apt install -y python3 ncbi-blast+ && \
    apt install -y python-biopython \
                   python3-pip \
                   wget && \
    pip3 install biopython \
                 ete3 \
                 pycosat \
                 PyYAML \
                 requests

# Install conda, bowtie2, and krakenuniq
RUN cd /usr/local/ && \
    wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /usr/local/miniconda && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash -c "source ~/.bashrc" && \
    conda activate && \
    conda install -c bioconda bowtie2 && \
    conda install -c bioconda krakenuniq && \
    conda clean -afy
