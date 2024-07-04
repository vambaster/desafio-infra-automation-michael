FROM python:latest

USER root

RUN apt-get update && apt-get install -y sudo

RUN pip install ansible

WORKDIR /ansible

COPY . /ansible

CMD ["bash"]