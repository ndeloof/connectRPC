package main

import (
	"context"
	"fmt"
	"log"
	"net/http"

	"connectrpc.com/connect"
	greetv1 "github.com/example/connectrpc-hello/gen/greet/v1"
	"github.com/example/connectrpc-hello/gen/greet/v1/greetv1connect"
)

func main() {
	client := greetv1connect.NewGreetServiceClient(
		http.DefaultClient,
		"http://localhost:2375/com.docker.demo/",
	)

	req := connect.NewRequest(&greetv1.GreetRequest{
		Name: "World",
	})

	res, err := client.Greet(context.Background(), req)
	if err != nil {
		log.Fatalf("Failed to call Greet: %v", err)
	}

	fmt.Println(res.Msg.Greeting)
}
