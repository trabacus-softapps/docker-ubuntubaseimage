FROM ubuntu:latest
MAINTAINER Arun T K <arun.kalikeri@xxxxxxxx.com>

ADD . /pd_build

RUN /pd_build/install.sh

CMD ["/bin/bash"]
