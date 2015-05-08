FROM ubuntu:14.04
MAINTAINER Viktor Petersson <vpetersson@wireload.net>

# Set the env variables to non-interactive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes

RUN apt-get -qq update && \
    apt-get -qq -y install wget texlive-latex-base texlive-fonts-recommended && \
    apt-get -qq -y install texlive-fonts-extra texlive-latex-extra && \
    apt-get clean

RUN wget https://github.com/jgm/pandoc/releases/download/1.13.2/pandoc-1.13.2-1-amd64.deb && \
    dpkg -i pandoc* && \
    rm pandoc* && \
    apt-get clean

RUN mkdir /docs
WORKDIR /docs

ADD start.sh /start.sh
CMD /start.sh
