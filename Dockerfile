FROM ubuntu:latest

ENV REDPEN_VERSION=1.10.1
ENV GHR_VERSION=0.12.0

# https://askubuntu.com/q/909277
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get -y install \
  git \
  make \
  texlive \
  texlive-lang-cjk \
  texlive-latex-extra \
  latexmk \
  default-jre \
  curl \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /redpen \
  && curl -#Lo - https://github.com/redpen-cc/redpen/releases/download/redpen-${REDPEN_VERSION}/redpen-${REDPEN_VERSION}.tar.gz \
  | tar xz -C /redpen --strip-components 1

ENV REDPEN /redpen/bin/redpen

RUN mkdir /ghr \
  && curl -#Lo - https://github.com/tcnksm/ghr/releases/download/v${GHR_VERSION}/ghr_v${GHR_VERSION}_linux_amd64.tar.gz \
  | tar xz -C /ghr --strip-components 1

ENV GHR /ghr/ghr

VOLUME thesis
WORKDIR thesis

CMD ["make"]
