.PHONY: setup build compile image deploy run clean
TAG?=$(shell git rev-parse --short HEAD)

default: build

build: clean compile

clean:
	rm -f bin/*
	go clean

compile:
	mkdir -p bin
	cd cmd; CGO_ENABLED=0 go build -o ../../bin/sauce -a -tags netgo -ldflags "-X github.com/christianvozar/sauce/version.GitSHA=$(TAG)" .
