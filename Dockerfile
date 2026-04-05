FROM python:3.6.15-slim-bullseye

ADD . /pd_build

RUN /pd_build/install.sh

CMD ["/bin/bash"]
