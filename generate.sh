#!/bin/bash

# Install protoc plugins if not exists
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# Generate for Order service
protoc --go_out=./golang --go_opt=paths=source_relative \
       --go-grpc_out=./golang --go-grpc_opt=paths=source_relative \
       ./order/*.proto

# Generate for Payment service
protoc --go_out=./golang --go_opt=paths=source_relative \
       --go-grpc_out=./golang --go-grpc_opt=paths=source_relative \
       ./payment/*.proto

# Generate for Shipping service
protoc --go_out=./golang --go_opt=paths=source_relative \
       --go-grpc_out=./golang --go-grpc_opt=paths=source_relative \
       ./shipping/*.proto

echo "Proto generation completed!"