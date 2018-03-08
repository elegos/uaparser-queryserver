GOCMD=go
GOGET=$(GOCMD) get
GOBUILD=$(GOCMD) build
OUTDIR=out
BINARY_NAME=uaparser

all:
	GOPATH=/project GOBIN=/project/bin $(GOGET) -t -v ./...
	cd src/github.com/ua-parser/uap-go/uap-core && git fetch && git reset --hard origin/master
	sed -i 's/git submodule update//' src/github.com/ua-parser/uap-go/build.sh
	cd src/github.com/ua-parser/uap-go && ./build.sh
	ninja -t clean
	ninja

clean:
	ninja -t clean

