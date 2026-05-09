# Estágio 1: Compilação
FROM alpine:3.18 AS build

RUN apk add --no-cache \
    build-base \
    cmake \
    git \
    gperf \
    linux-headers \
    openssl-dev \
    zlib-dev

WORKDIR /src
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git .
WORKDIR /src/build
RUN cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . --target install

# Estágio 2: Execução
FROM alpine:3.18

RUN apk add --no-cache libstdc++ openssl zlib
COPY --from=build /usr/local/bin/telegram-bot-api /usr/local/bin/telegram-bot-api

EXPOSE 8081
ENTRYPOINT ["telegram-bot-api"]
