#!/usr/bin/env python3
import asyncio
from connectrpc.client import AsyncConnectionPool
from gen.greet.v1.greet_pb2 import GreetRequest
from gen.greet.v1.greet_connect import GreetServiceClient


async def main():
    async with AsyncConnectionPool() as pool:
        client = GreetServiceClient(pool, base_url="http://localhost:2375/com.docker.demo/")
        request = GreetRequest(name="World")
        response = await client.greet(request)
        print(response.greeting)


if __name__ == "__main__":
    asyncio.run(main())
