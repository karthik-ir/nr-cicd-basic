FROM golang:alpine

RUN apk update
RUN apk add make gcc libc-dev
