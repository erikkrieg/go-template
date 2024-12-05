# Module name (excluding domain)
name := `basename "$(go list -m)"`

# Default flags.
build-flags := "-trimpath -ldflags='-w -s'"
run-flags := ""
test-flags := "-v"
lint-flags := "-v"
tidy-flags := "-x"
fmt-flags := "-x"

# List available commands.
list:
  @just --list

# Build Go source code.
build *flags=build-flags:
  go build {{flags}} -o bin/{{name}}

# Run compiles and runs the main Go package.
run *flags=run-flags:
  @go run {{flags}} ./main.go

# Test runs all tests.
test *flags=test-flags:
  go test ./... {{flags}}

# Lint Go source code.
lint *flags=lint-flags:
  golangci-lint run {{flags}}

# Update go.mod and go.sum.
tidy *flags=tidy-flags:
  go mod tidy {{flags}}

# Format Go source code.
fmt *flags=fmt-flags:
  go fmt {{flags}} ./...

# Run all checks. Note, this can modify files.
check: tidy fmt lint test

# Rename changes the module name and all references to it
rename user project:
  @echo "Changing module name to github.com/{{user}}/{{project}}..."
  @git ls-files | xargs sed -i.bak "s|$(go list -m)|github.com/{{user}}/{{project}}|g"
  @find . -name "*.bak" -delete


