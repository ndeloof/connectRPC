package main

import (
	"context"
	"fmt"
	"log"
	"net"
	"net/http"

	"connectrpc.com/connect"
	greetv1 "github.com/example/connectrpc-hello/gen/greet/v1"
	"github.com/example/connectrpc-hello/gen/greet/v1/greetv1connect"
	"golang.org/x/net/http2"
	"golang.org/x/net/http2/h2c"
)

type GreetServer struct{}

func (s *GreetServer) Greet(
	ctx context.Context,
	req *connect.Request[greetv1.GreetRequest],
) (*connect.Response[greetv1.GreetResponse], error) {
	log.Printf("Received request for name: %s", req.Msg.Name)

	greeting := fmt.Sprintf("Hello, %s!", req.Msg.Name)

	res := connect.NewResponse(&greetv1.GreetResponse{
		Greeting: greeting,
	})

	return res, nil
}

func main() {
	greeter := &GreetServer{}
	mux := http.NewServeMux()

	path, handler := greetv1connect.NewGreetServiceHandler(greeter)
	mux.Handle(path, handler)

	fmt.Println("Server listening on /var/lib/docker/extensions.d/com.docker.demo.sock")

	unixListener, err := net.Listen("unix", "/var/lib/docker/extensions.d/com.docker.demo.sock")
	if err != nil {
		panic(err)
	}

	// Use h2c so we can serve HTTP/2 without TLS
	server := http.Server{
		Handler: h2c.NewHandler(mux, &http2.Server{}),
	}
	server.Serve(unixListener)
}
