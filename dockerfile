FROM ubuntu
MAINTAINER Leftbrain Stuff (leftbrainstuff@gmail.com)
RUN apt-get update
RUN apt-get install -y nginx
ENTRYPOINT [“/usr/sbin/nginx”,”-g”,”daemon on;”]
EXPOSE 80
