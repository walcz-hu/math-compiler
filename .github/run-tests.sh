#!/bin/bash

# Install the lint-tool
go get -u golang.org/x/lint/golint

# At this point failures cause aborts
set -e

# Init the modules
go mod init || true

# Run the linter
echo "Running linter .."
golint -set_exit_status ./...
echo "Linter complete .."

# Run our golang tests
go test ./...

# Run functional test-cases
./test.sh
