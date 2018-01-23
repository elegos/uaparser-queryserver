GOCMD=go
GOGET=$(GOCMD) get
GOBUILD=$(GOCMD) build
OUTDIR=out
BINARY_NAME=uaparser

all:
	GOPATH=/project GOBIN=/project/bin $(GOGET) -t -v ./...
	ninja -t clean
	ninja

clean:
	ninja -t clean

