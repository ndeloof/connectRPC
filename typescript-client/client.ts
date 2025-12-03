import { createClient } from "@connectrpc/connect";
import { createConnectTransport } from "@connectrpc/connect-node";
import { GreetService } from "./gen/greet/v1/greet_pb.js";

const transport = createConnectTransport({
  baseUrl: "http://localhost:2375/com.docker.demo/",
  httpVersion: "1.1",
});

const client = createClient(GreetService, transport);

const response = await client.greet({ name: "World" });

console.log(response.greeting);
