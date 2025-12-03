package com.example;

import com.connectrpc.ProtocolClientConfig;
import com.connectrpc.impl.ProtocolClient;
import com.greet.v1.GreetRequest;
import com.greet.v1.GreetResponse;
import com.greet.v1.GreetServiceClient;
import okhttp3.OkHttpClient;

public class Client {
    public static void main(String[] args) {
        OkHttpClient okHttpClient = new OkHttpClient();

        ProtocolClient protocolClient = new ProtocolClient(
            okHttpClient,
            new ProtocolClientConfig(
                "http://localhost:2375/com.docker.demo/"
            )
        );

        GreetServiceClient client = new GreetServiceClient(protocolClient);

        GreetRequest request = GreetRequest.newBuilder()
            .setName("World")
            .build();

        client.greet(request, response -> {
            if (response.success()) {
                System.out.println(response.success().getMessage().getGreeting());
            } else {
                System.err.println("Error: " + response.failure().getCause());
            }
        });
    }
}
