#!/bin/bash

# ConnectRPC Code Generation Script
# This script generates client and server code from proto files for all supported languages

set -e  # Exit on error

echo "🔧 Generating code from proto files..."
echo ""

# Check if buf is installed
if ! command -v buf &> /dev/null; then
    echo "❌ Error: buf CLI is not installed"
    echo "Please install it from: https://buf.build/docs/installation"
    exit 1
fi

# Clean previous generated code
echo "🧹 Cleaning previous generated code..."
rm -rf gen/
rm -rf python-client/gen/
rm -rf typescript-client/gen/
rm -rf java-client/src/main/java/com/greet/

# Generate code using buf
echo "⚙️  Running buf generate..."
buf generate

# Verify generation succeeded
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Code generation completed successfully!"
    echo ""
    echo "Generated files:"
    echo "  • Go:         gen/greet/v1/"
    echo "  • Python:     python-client/gen/greet/v1/"
    echo "  • Java:       java-client/src/main/java/com/greet/v1/"
    echo "  • TypeScript: typescript-client/gen/greet/v1/"
else
    echo ""
    echo "❌ Code generation failed"
    exit 1
fi
