#!/bin/bash

# Script to run all ConnectRPC clients
# Make sure the server is running on http://localhost:8080 before executing

set -e

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "====================================="
echo "Running ConnectRPC Clients"
echo "====================================="
echo ""

# Go client
echo "1. Running Go client..."
echo "-------------------------------------"
(cd go-client && go run main.go)
echo ""

# TypeScript client
echo "2. Running TypeScript client..."
echo "-------------------------------------"
(cd typescript-client && npm start 2>/dev/null)
echo ""

# Python client (currently has dependency issues, commented out)
# echo "3. Running Python client..."
# echo "-------------------------------------"
# cd python-client
# source venv/bin/activate
# python client.py
# deactivate
# cd ..
# echo ""

# Java client (currently has dependency issues, commented out)
# echo "4. Running Java client..."
# echo "-------------------------------------"
# cd java-client
# mvn exec:java -Dexec.mainClass="com.example.Client" -q
# cd ..
# echo ""

echo "====================================="
echo "All clients executed successfully!"
echo "====================================="
echo ""
echo "Note: Python and Java clients are currently disabled due to dependency issues."
echo "  - Python: connectrpc package version mismatch with generated code"
echo "  - Java: Generated code incompatible with connect-kotlin library"
