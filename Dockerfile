FROM golang:1.15 AS build
WORKDIR /app
RUN git clone https://github.com/polynetwork/heco-relayer.git  && \
    cd heco-relayer && \
    go build -o run_heco_relayer main.go

FROM ubuntu:18.04
WORKDIR /app
COPY ./config.json config.json
COPY --from=build /app/heco-relayer/run_heco_relayer run_heco_relayer
CMD ["/bin/bash"]