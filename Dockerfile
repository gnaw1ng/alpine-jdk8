FROM alpine:latest
RUN echo -e "https://mirrors.ustc.edu.cn/alpine/latest-stable/main\nhttps://mirrors.ustc.edu.cn/alpine/latest-stable/community\n" > /etc/apk/repositories \
    && apk update \
    && apk add --no-cache openjdk8 tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime  \
    && echo Asia/Shanghai > /etc/timezone \
    && apk del tzdata \
    && rm -rf /tmp/* /var/cache/apk/*
WORKDIR /project