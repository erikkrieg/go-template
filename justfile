# Module name (excluding domain)
name := `basename "$(go list -m)"`

# Default flags.
build-flags := "-trimpath -ldflags='-w -s'"
test-flags := "-v"

# List available commands.
list:
  @just --list

# Build Go source code.
build *flags=build-flags:
  go build {{flags}} -o bin/{{name}}

# Run compiles and runs the main Go package.
run:
  @go run ./main.go

# Test runs all tests.
test *flags=test-flags:
  go test ./... {{flags}}

# Lint Go source code.
lint *args:
  @golangci-lint run -v {{args}}
