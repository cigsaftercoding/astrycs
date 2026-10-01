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

### Text

| Command | Description |
| --- | --- |
| `len <text>` | Print the length of the text |
| `echo <text>` | Print text back |
| `upper <text>` | Upper-case the given text |
| `lower <text>` | Lower-case the given text |
| `title <text>` | Capitalize the first letter of each word |
| `capitalize <text>` | Upper-case the first letter only |
| `swapcase <text>` | Swap the case of every letter |
| `trim <text>` | Trim surrounding whitespace |
| `nospace <text>` | Collapse whitespace runs into single spaces |
| `pad <width> <text>` | Left-pad text with spaces up to `<width>` |
| `indent <n> <text>` | Indent every line by `<n>` spaces |
| `indent-right <n> <text>` | Indent every line on the right |
| `dedent <text>` | Strip leading whitespace from every line |
| `reverse <text>` | Reverse the text |
| `reverse-words <text>` | Reverse the order of the words |
| `slug <text>` | Convert text into a url slug |
| `camel <text>` | Convert text to camelCase |
| `kebab <text>` | Convert text to kebab-case |
| `snake <text>` | Convert text to snake_case |
| `initials <text>` | Extract the initials of each word |
| `squeeze <text>` | Collapse runs of repeated characters |
| `urlencode <text>` | Percent-encode reserved characters |
| `mask <keep> <text>` | Mask the middle of a string |
| `truncate <width> <text>` | Shorten text to a width |
| `center <width> <text>` | Center text within a width |
| `replace <find> <with> <text>` | Replace every occurrence of `<find>` |
| `strip <chars> <text>` | Delete the given characters from the text |
| `count-char <char> <text>` | Count occurrences of a character |

### Lines and columns

| Command | Description |
| --- | --- |
| `head <n> <text>` | Print only the first `<n>` lines |
| `tail <n> <text>` | Print only the last `<n>` lines |
| `lines <text>` | Count the lines in the text |
| `words <text>` | Count the words in the text |
| `unique <text>` | Sort the lines and drop duplicates |
| `sortlines <text>` | Sort the lines alphabetically |
| `unique-words <text>` | Sort and deduplicate the words |
| `number-lines <text>` | Prefix each line with its number |
| `bullet [marker] <text>` | Prefix each line with a bullet |
| `wrap <width> <text>` | Wrap text to `<width>` columns |
| `chunk <size> <text>` | Break text into fixed-size chunks |
| `take <n> <text>` | Keep the first `<n>` words |
| `drop <n> <text>` | Discard the first `<n>` words |
| `split <sep> <text>` | Split text on a separator, one per line |
| `join <sep> [text...]` | Join the remaining arguments with `<sep>` |
| `csv-join <sep> [text...]` | Join arguments as csv cells |

### Numbers

| Command | Description |
| --- | --- |
| `repeat N TEXT` | Repeat `TEXT` `N` times |
| `sum [numbers...]` | Add the given numbers |
| `max [numbers...]` | Print the largest number |
| `min [numbers...]` | Print the smallest number |
| `abs <n>` | Print the absolute value of a number |
| `round <n>` | Round a number to the nearest integer |
| `even <n>` | Report whether a number is even |
| `odd <n>` | Report whether a number is odd |
| `ordinal <n>` | Render a number as an ordinal (1st, 2nd, 3rd) |
| `pluralize <count> <singular> [plural]` | Pick the right plural form |

### Predicates

| Command | Description |
| --- | --- |
| `is-empty <text>` | Report whether the text is empty |
| `is-number <text>` | Report whether the text is numeric |
| `contains <needle> <text>` | Test for a substring |
| `starts-with <prefix> <text>` | Test a prefix |
| `ends-with <suffix> <text>` | Test a suffix |
| `yesno <text>` | Normalise yes/no style answers |
| `default <fallback> <text>` | Fall back when the text is empty |

### Utility

| Command | Description |
| --- | --- |
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
