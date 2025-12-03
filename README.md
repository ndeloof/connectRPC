# ConnectRPC Hello World Example

This project demonstrates a simple "Hello World" API using ConnectRPC with a Go server and clients in Go, Python, Java, and TypeScript.

## Project Structure

```
.
├── proto/                    # Protocol Buffer definitions
│   └── greet/v1/
│       └── greet.proto
├── go-server/               # Go server implementation
├── go-client/               # Go client
├── python-client/           # Python client
├── java-client/             # Java client
├── typescript-client/       # TypeScript client
├── buf.yaml                 # Buf configuration
└── buf.gen.yaml            # Code generation configuration
```

## Prerequisites

- [Buf CLI](https://buf.build/docs/installation) for code generation
- Go 1.21+
- Python 3.8+
- Java 11+
- Node.js 18+

## Setup

### 1. Generate Code from Proto Files

First, install the Buf CLI and generate the code for all languages:

```bash
# Use the provided generation script
./generate.sh

# Or run buf directly
buf generate
```

This will generate:
- Go code in `gen/`
- Python code in `python-client/gen/`
- Java code in `java-client/src/main/java/`
- TypeScript code in `typescript-client/gen/`

**Note:** Run `./generate.sh` anytime you modify the proto files.

### 2. Start the Go Server

```bash
cd go-server
go mod download
go run main.go
```

The server will start on `http://localhost:8080`

## Running Clients

### Go Client

```bash
cd go-client
go mod download
go run main.go
```

Expected output: `Hello, World!`

### Python Client

```bash
cd python-client
pip install -e .
python client.py
```

Expected output: `Hello, World!`

### Java Client

```bash
cd java-client
mvn clean install
mvn exec:java -Dexec.mainClass="com.example.Client"
```

Expected output: `Hello, World!`

### TypeScript Client

```bash
cd typescript-client
npm install
npm start
```

Expected output: `Hello, World!`

## API Details

The API exposes a single RPC method:

**Service:** `greet.v1.GreetService`

**Method:** `Greet`
- Request: `GreetRequest { name: string }`
- Response: `GreetResponse { greeting: string }`

Example:
```
Request:  { name: "World" }
Response: { greeting: "Hello, World!" }
```

## Customization

To change the greeting name, modify the `Name` field in the client code:

**Go:** `go-client/main.go:18`
```go
req := connect.NewRequest(&greetv1.GreetRequest{
    Name: "YourName",
})
```

**Python:** `python-client/client.py:12`
```python
data=GreetRequest(name="YourName"),
```

**Java:** `java-client/src/main/java/com/example/Client.java:23`
```java
GreetRequest request = GreetRequest.newBuilder()
    .setName("YourName")
    .build();
```

**TypeScript:** `typescript-client/client.ts:13`
```typescript
const response = await client.greet({ name: "YourName" });
```

## Troubleshooting

### Port already in use
If port 8080 is already in use, modify the port in:
- `go-server/main.go:34` (server)
- All client files (change `http://localhost:8080` to your desired port)

### Code generation fails
Make sure you have the Buf CLI installed:
```bash
buf --version
```

### Connection refused
Make sure the Go server is running before starting any client.
