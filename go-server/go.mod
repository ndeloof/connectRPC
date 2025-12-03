module github.com/example/connectrpc-hello/go-server

go 1.21

require (
	connectrpc.com/connect v1.16.2
	github.com/example/connectrpc-hello/gen v0.0.0
	golang.org/x/net v0.23.0
)

require (
	golang.org/x/text v0.14.0 // indirect
	google.golang.org/protobuf v1.34.1 // indirect
)

replace github.com/example/connectrpc-hello/gen => ../gen
