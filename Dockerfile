FROM alpine
MAINTAINER Gitai<gitai.cn@gmail.com>
LABEL maintainer "Gitai<gitai.cn@gmail.com>"

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update
RUN apk add 
RUN apk add xfce4 paper-gtk-theme@testing paper-icon-theme@testing 
# RUN apk add lxappearance@testing

ENV HOME /home/user
COPY .gtkrc-2.0 $HOME/.gtkrc-2.0
RUN adduser -h $HOME -D user \
	&& chown -R user:user $HOME
WORKDIR $HOME

ENTRYPOINT [ "xfconf-query -c xfwm4 -p /general/theme -s Paper && startxfce4" ]