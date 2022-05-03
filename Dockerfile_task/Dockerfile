FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev

COPY ./requirements.txt /opt/webapp/requirements.txt

WORKDIR /opt/webapp

RUN pip3 install -r requirements.txt

COPY . /opt/webapp

ENTRYPOINT [ "python3" ]

EXPOSE 5000

CMD [ "app.py" ]

# docker build -t docker-flask:latest .
# docker run -d --name flaskapp -p5000:5000 docker-flask:latest
# root@azamat-VirtualBox:/home/azamat/docker/test# curl http://localhost:5000
# <h1>Hello, World!<h1>
