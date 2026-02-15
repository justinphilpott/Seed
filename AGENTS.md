# Agent Context for Seed

Go CLI tool for rapid agentic POC scaffolding. Run `seed <directory>` to create a new project with minimal, agent-friendly documentation files.

> For Claude Code-specific instructions, see [CLAUDE.md](CLAUDE.md).

## Quick Links

- [CLAUDE.md](CLAUDE.md) - Claude Code instructions and quick reference
- [CONTEXT.md](CONTEXT.md) - Detailed project context, template variables, design decisions
- [BUILD.md](BUILD.md) - Build guide, Go concepts, troubleshooting

## Project Constraints

- Single external dependency (Charm's Huh library for TUI)
- Templates embedded at compile time via `//go:embed templates/*.tmpl`
- Devcontainer JSON generated programmatically (encoding/json), not via text/template
- Separation of concerns: wizard collects input, scaffold writes files, main orchestrates
- Version injected at build time via `-ldflags "-X main.Version=$(VERSION)"`

## Key Files

- **main.go** - CLI entry point, argument parsing, orchestration
- **wizard.go** - TUI wizard (Charm Huh), user input collection
- **scaffold.go** - Template rendering (embed.FS + text/template), devcontainer generation
- **scaffold_test.go** - Scaffold/template tests
- **wizard_test.go** - Wizard validation and data transformation tests
- **templates/*.tmpl** - Embedded project templates (README, AGENTS, DECISIONS, TODO, LEARNINGS)

## Commands

```bash
go mod tidy          # Install/update dependencies
go run .             # Run without building
make build           # Build binary with version injection
make test            # Run tests
go fmt ./...         # Format code
go vet ./...         # Static analysis
```

## Testing

- `make test` or `go test -count=1 ./...`
- Table-driven tests with `t.Run()` subtests
- Temp directory isolation via `tempDir(t)` helper

## Branch

Current work on: `dev` branch. Main branch: `main`.
