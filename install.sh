#!/bin/bash

# Change permission of release script
chmod +x release.sh

# Package the application
dotnet publish

# Copy the output to bin
mkdir -p /opt/bin/csharp
cp ./bin/Debug/net6.0/publish/* /opt/bin/csharp
cp ./release.sh /opt/bin/release

# Update path variable
export PATH=/opt/bin
