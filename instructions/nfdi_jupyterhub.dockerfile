#FROM jupyter/base-notebook
FROM jupyterhub/jupyterhub

USER root
RUN apt-get update && apt-get install --yes --no-install-recommends \
    dnsutils iputils-ping nano screen \
 && rm -rf /var/lib/apt/lists/*
RUN export TERM=xterm
RUN apt-get -y update
RUN apt-get -y install git
RUN python3 -m pip install git+https://github.com/jupyterhub/jupyterhub-idle-culler.git
RUN python3 -m pip install git+https://github.com/jupyter/nbgrader.git@5a81fd5 \
 && jupyter nbextension install --symlink --sys-prefix --py nbgrader \
 && jupyter nbextension enable --sys-prefix --py nbgrader \
 && jupyter serverextension enable --sys-prefix --py nbgrader

RUN python3 -m pip install ngshare_exchange notebook
RUN pip install --no-cache jupyterhub-simplespawner
RUN pip install --no-cache jupyterhub-dummyauthenticator

COPY nbgrader_config.py /etc/jupyter/nbgrader_config.py

RUN mkdir /tmp/exchange
RUN chmod ugo+rw /tmp/exchange

RUN useradd -m -p pa.OhatThRJBA -s  /bin/bash instructor
RUN echo instructor:coding4geo | chpasswd 

#USER jovyan
#jupyterhub --generate-config
