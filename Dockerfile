FROM alpine
MAINTAINER Gitai<gitai.cn@gmail.com>
LABEL maintainer "Gitai<gitai.cn@gmail.com>"
RUN echo -e "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main \nhttp://dl-cdn.alpinelinux.org/alpine/latest-stable/community \n\n@edge http://dl-cdn.alpinelinux.org/alpine/edge/main \n@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update
RUN apk add 
RUN apk add xfce4 
RUN apk add paper-gtk-theme@testing 
RUN apk add paper-icon-theme@testing 
RUN apk add lxappearance@testing

ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
	&& chown -R user:user $HOME
WORKDIR $HOME

ENTRYPOINT [ "startxfce4" ]