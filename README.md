# astrycs

A tiny, dependency-free helper toolkit for the shell.

## Overview

`astrycs` bundles a handful of small, composable helpers so you can avoid
re-writing the same one-liners in every script. It has no runtime
dependencies beyond a POSIX shell.

## Requirements

A POSIX shell plus the usual text utilities (`awk`, `sed`,
`tr`, `wc`, `fold`, `sort`). No non-standard packages are needed.

## Usage

```sh
./bin/astrycs help
./bin/astrycs upper "hello world"
./bin/astrycs repeat 3 "again"
./bin/astrycs slug "Hello, World!"
./bin/astrycs pad 10 "total"
```

## Commands

| Command | Description |
| --- | --- |
| `echo <text>` | Print text back |
| `upper <text>` | Upper-case the given text |
| `repeat N TEXT` | Repeat `TEXT` `N` times |
| `lower <text>` | Lower-case the given text |
| `len <text>` | Print the length of the text |
| `trim <text>` | Trim surrounding whitespace |
| `join <sep> [text...]` | Join the remaining arguments with `<sep>` |
| `slug <text>` | Convert text into a url slug |
| `pad <width> <text>` | Left-pad text with spaces up to `<width>` |
| `reverse <text>` | Reverse the text |
| `strip <chars> <text>` | Delete the given characters from the text |
| `title <text>` | Capitalize the first letter of each word |
| `nospace <text>` | Collapse whitespace runs into single spaces |
| `wrap <width> <text>` | Wrap text to `<width>` columns |
| `indent <n> <text>` | Indent every line by `<n>` spaces |
| `words <text>` | Count the words in the text |
| `lines <text>` | Count the lines in the text |
| `head <n> <text>` | Print only the first `<n>` lines |
| `tail <n> <text>` | Print only the last `<n>` lines |
| `unique <text>` | Sort the lines and drop duplicates |
| `sortlines <text>` | Sort the lines alphabetically |
| `csv-join <sep> [text...]` | Join arguments as csv cells |
| `replace <find> <with> <text>` | Replace every occurrence of `<find>` |
| `camel <text>` | Convert text to camelCase |
| `kebab <text>` | Convert text to kebab-case |
| `snake <text>` | Convert text to snake_case |
| `capitalize <text>` | Upper-case the first letter only |
| `swapcase <text>` | Swap the case of every letter |
| `initials <text>` | Extract the initials of each word |
| `starts-with <prefix> <text>` | Test a prefix |
| `ends-with <suffix> <text>` | Test a suffix |
| `contains <needle> <text>` | Test for a substring |
| `is-empty <text>` | Report whether the text is empty |
| `is-number <text>` | Report whether the text is numeric |
| `split <sep> <text>` | Split text on a separator, one per line |
| `default <fallback> <text>` | Fall back when the text is empty |
| `take <n> <text>` | Keep the first `<n>` words |
| `drop <n> <text>` | Discard the first `<n>` words |
| `reverse-words <text>` | Reverse the order of the words |
| `unique-words <text>` | Sort and deduplicate the words |
| `count-char <char> <text>` | Count occurrences of a character |
| `sum [numbers...]` | Add the given numbers |
| `help` | Show usage |

## Exit codes

`0` on success, `1` for an unknown command or a usage error.

## Composition

Commands read and write plain text, so they pipe together:

```sh
./bin/astrycs title "hello world" | ./bin/astrycs reverse
```

## Development

```sh
sh test/astrycs_test.sh
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for the contribution workflow.

## License

[MIT](LICENSE)
