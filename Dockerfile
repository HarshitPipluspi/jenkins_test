
FROM ubuntu:latest
USER root
RUN apt-get update && \
apt-get install -y python3-pip python-dev-is-python3 build-essential
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
ADD . /flask-app
WORKDIR /flask-app
RUN apt install -y python3-flask
ENTRYPOINT ["python3"]
CMD ["app.py"]