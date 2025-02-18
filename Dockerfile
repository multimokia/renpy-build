FROM ubuntu:24.04 AS builder
LABEL authors="multimokia"

COPY ./build.sh .
COPY ./tars/android-ndk-r27c-linux.zip .
COPY ./tars/CubismSdkForNative-4-r.6.2.zip .

VOLUME "/outdir"

ENTRYPOINT ["./bin/bash", "build.sh"]