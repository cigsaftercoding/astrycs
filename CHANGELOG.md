# Changelog

All notable changes to this project are documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/).

## [Unreleased]

### Added
- `starts-with` command.
- `initials` command.
- `swapcase` command.
- `capitalize` command.
- `snake` command for snake_case conversion.
- Shell style guidance.
- Pull request scope guidance.
- `kebab` command for kebab-case conversion.
- Composition examples in the readme.
- Exit code documentation.
- `camel` command for camelCase conversion.
- Runtime requirements section in the readme.
- Extra usage examples in the readme.
- `replace` command for substring replacement.
- `csv-join` command for joining arguments as csv cells.
- `sortlines` command for sorting lines.
- `unique` command for sorting and deduplicating lines.
- `tail` command for taking the last lines.
- `head` command for taking the first lines.
- `lines` command for counting lines.
- `words` command for counting words.
- `indent` command for indenting text.
- `wrap` command for wrapping text to a fixed width.
- Initial `astrycs` helper toolkit (`echo`, `upper`, `repeat`).
- Test harness under `test/`.
- Continuous integration workflow.
- Project documentation, license, and contribution guide.
- `lower` command for lower-casing text.
- `len` command for measuring text length.
- `trim` command for stripping surrounding whitespace.
- `join` command for joining arguments with a separator.
- `slug` command for generating url slugs.
- `pad` command for fixed-width output.
- `reverse` command for reversing text.
- `strip` command for deleting characters.
- `title` command for title-casing text.
- `nospace` command for collapsing whitespace.

### Changed
- Test asserting the unknown-command exit code.
- Test asserting help output.
- Regression tests for empty input.
- editorconfig rules for yaml.
- Test artefacts in .gitignore.
- Least-privilege workflow permissions.
- dash job in CI to catch bashisms.
- CI matrix across ubuntu and macos.
- shellcheck lint step in CI.
