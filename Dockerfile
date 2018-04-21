FROM centos:latest

RUN yum update -y && \
    yum groupinstall -y 'Development Tools' && \
    yum install -y wget && \
    yum clean all

RUN echo 'export PATH=/opt/conda/bin:$PATH' > sudo tee -a /etc/profile.d/conda.sh && \
    echo 'export PATH=/opt/conda/bin:$PATH' > sudo tee -a /home/jenkins/.bashrc && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda

ENV PATH "/opt/conda/bin:$PATH"
ADD . dlc-demo
WORKDIR dlc-demo

RUN pip install -r requirements.txt
CMD ["python", "demo.py"]
