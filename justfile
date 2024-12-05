# Module name (excluding domain)
name := `basename "$(go list -m)"`

build-flags := "-trimpath -ldflags='-w -s'"

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
test:
  @go test ./... -v

# Lint Go source code.
lint *args:
  @golangci-lint run -v {{args}}
