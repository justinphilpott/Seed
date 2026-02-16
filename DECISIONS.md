# Decisions

Record architectural choices so future contributors (and agents) understand why.

---

### Flat package structure over cmd/internal layout

**Context**: Considered restructuring to `cmd/seed/`, `internal/wizard/`, `internal/scaffold/` to follow the multi-package Go convention.
**Decision**: Keep the flat `package main` layout. At ~1400 lines across 4 source files, this is a single-binary CLI with no reusable library code. The Go team explicitly recommends flat layouts for small commands; the `cmd/internal/pkg` convention is for multi-binary repos or projects with importable libraries.
**Impact**: Less boilerplate, no unnecessary export boundaries. Revisit if we add a second binary, extract a library, or grow past ~3000 lines.

---
