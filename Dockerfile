FROM golang:latest

RUN go install github.com/ampproject/amppackager/cmd/transform

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
