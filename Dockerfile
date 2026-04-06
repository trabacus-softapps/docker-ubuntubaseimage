FROM python:3.8.20-slim-bookworm

ADD . /pd_build

RUN /pd_build/install.sh

CMD ["/bin/bash"]
