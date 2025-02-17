FROM golang AS builder
WORKDIR /src
RUN git clone https://github.com/tenox7/ezhttpd.git
WORKDIR /src/ezhttpd
RUN go mod download
ARG TARGETARCH
RUN CGO_ENABLED=0 GOOS=linux GOARCH=${TARGETARCH} go build -o /ezhttpd-${TARGETARCH}