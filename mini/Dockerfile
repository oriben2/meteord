FROM debian:wheezy
MAINTAINER oricodes

ENV METEORD_DIR /opt/meteord
COPY scripts $METEORD_DIR

ONBUILD COPY ./ /app
ONBUILD RUN bash $METEORD_DIR/init_then_build.sh

EXPOSE 80
ENTRYPOINT bash $METEORD_DIR/run_app.sh
