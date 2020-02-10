FROM alpine:3.10

LABEL maintainer="github.com/Coqueiro"

ENV SPARK_VERSION 2.4.4
ENV PYSPARK_PYTHON /usr/bin/python3

RUN apk add --no-cache curl bash openjdk8-jre python3 py-pip nss libc6-compat \
      && ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2
      
RUN python3 -m pip install pyspark==${SPARK_VERSION}

# Define working directory
WORKDIR /app

# Define default command
CMD ["bash"]