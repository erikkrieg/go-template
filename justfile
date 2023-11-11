# List available commands.
list:
  @just --list

# Run compiles and runs the main Go package.
run:
  @go run src/main.go
