FROM ubuntu:19.10
ADD go /go

ENTRYPOINT ["/go/bin/go"]
