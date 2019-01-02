FROM node:6-onbuild
MAINTAINER Leftbrain Stuff (leftbrainstuff@gmail.com)
RUN apt-get update
RUN apt-get install -y nginx
ENTRYPOINT [“/usr/sbin/nginx”,”-g”,”daemon off;”]
EXPOSE 80
