FROM golang:latest

WORKDIR /go/src/github.com/miekg/
RUN git clone https://github.com/miekg/coredns

WORKDIR /go/src/github.com/miekg/coredns
RUN go get ./... && go generate && go build

COPY Corefile /go/src/github.com/miekg/coredns

CMD ["/go/src/github.com/miekg/coredns/coredns"]
