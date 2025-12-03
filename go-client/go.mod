module github.com/example/connectrpc-hello/go-client

go 1.21

require (
	connectrpc.com/connect v1.16.2
	github.com/example/connectrpc-hello/gen v0.0.0
)

require google.golang.org/protobuf v1.34.1 // indirect

replace github.com/example/connectrpc-hello/gen => ../gen
