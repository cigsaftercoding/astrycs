# Contributing to astrycs

Thanks for taking the time to contribute!

## Getting started

1. Fork the repository and clone your fork.
2. Create a topic branch: `git checkout -b my-change`.
3. Make your change and keep commits small and focused.
4. Run the checks (see below).
5. Open a pull request against `main`.

## Commit messages

This project follows [Conventional Commits](https://www.conventionalcommits.org/).
Examples: `feat:`, `fix:`, `docs:`, `test:`, `chore:`.

Co-authors are welcome. Add them with a trailer:

```
Co-authored-by: Name <email@example.com>
```

## Scope

One pull request per change. Bug fixes and features land separately,
and each pull request should keep its tests green on its own.

## Adding a command

A subcommand needs wiring in five places, in this order:

1. `bin/astrycs` — a line in the `usage` block, for discoverability
2. `bin/astrycs` — a branch in the `case` statement
3. `test/astrycs_test.sh` — at least one `check`, including empty input
4. `README.md` — a row in the command table
5. `CHANGELOG.md` — a bullet under the unreleased section

Run `sh test/astrycs_test.sh` before opening the pull request.

## Checks

```sh
sh test/astrycs_test.sh
```

## Shell style

Four-space indentation, POSIX constructs only, and no bashisms —
`bin/astrycs` has to run under `dash` as well as `bash`.

## Code of conduct

Be kind. Assume good intent. Keep reviews constructive.
