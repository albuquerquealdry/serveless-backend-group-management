.PHONY: build clean deploy

build:
	env GOOS=linux GOARCH=amd64 CGO_ENABLED=0  go build -ldflags="-s -w" -o bin/create-group create-group/main.go
clean:
	rm -rf ./bin

deploy: clean build
	sls deploy --verbose
