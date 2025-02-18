FROM ubuntu:24.04 AS builder
LABEL authors="multimokia"

COPY ./build.sh .

VOLUME "/outdir"

ENTRYPOINT ["./bin/bash", "build.sh"]