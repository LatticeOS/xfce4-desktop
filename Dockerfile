FROM alpine
MAINTAINER Gitai<gitai.cn@gmail.com>
LABEL maintainer "Gitai<gitai.cn@gmail.com>"

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update
RUN apk add 
RUN apk add xfce4 
RUN apk add paper-gtk-theme@testing 
RUN apk add paper-icon-theme@testing 
RUN apk add lxappearance@testing

ENV HOME /home/user
RUN mkdir -p $HOME && echo -e "gtk-theme-name=\"Paper\" \ngtk-icon-theme-name=\"Paper\" \ngtk-font-name=\"Sans 10\"" > $HOME/.gtkrc-2.0.mine
RUN adduser -h $HOME -D user \
	&& chown -R user:user $HOME
WORKDIR $HOME

ENTRYPOINT [ "startxfce4" ]