# List available commands.
list:
  @just --list

# Run compiles and runs the main Go package.
run:
  @go run ./main.go

# Test runs all tests.
test:
  @go test ./... -v
