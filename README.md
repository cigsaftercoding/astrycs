# astrycs

A tiny, dependency-free helper toolkit for the shell.

## Overview

`astrycs` bundles a handful of small, composable helpers so you can avoid
re-writing the same one-liners in every script. It has no runtime
dependencies beyond a POSIX shell.

## Usage

```sh
./bin/astrycs help
./bin/astrycs upper "hello world"
./bin/astrycs repeat 3 "again"
```

## Commands

| Command | Description |
| --- | --- |
| `echo <text>` | Print text back |
| `upper <text>` | Upper-case the given text |
| `repeat N TEXT` | Repeat `TEXT` `N` times |
| `help` | Show usage |

## Development

```sh
sh test/astrycs_test.sh
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for the contribution workflow.

## License

[MIT](LICENSE)
