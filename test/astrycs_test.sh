#!/usr/bin/env sh
# Minimal test harness for astrycs.
set -eu

fail=0

check() {
    desc="$1"
    expected="$2"
    actual="$3"
    if [ "$expected" = "$actual" ]; then
        printf 'ok   - %s\n' "$desc"
    else
        printf 'FAIL - %s\n  expected: %s\n  actual:   %s\n' "$desc" "$expected" "$actual"
        fail=1
    fi
}

check "echo passes text through" "hello" "$(./bin/astrycs echo hello)"
check "upper upcases text" "HELLO" "$(./bin/astrycs upper hello)"
check "repeat emits N lines" "hi
hi" "$(./bin/astrycs repeat 2 hi)"

check "lower downcases text" "hello" "$(./bin/astrycs lower HELLO)"

check "len counts characters" "5" "$(./bin/astrycs len hello)"

check "trim strips surrounding space" "hello" "$(./bin/astrycs trim '   hello   ')"

check "join inserts the separator" "a,b,c" "$(./bin/astrycs join , a b c)"

check "slug builds url slugs" "hello-world" "$(./bin/astrycs slug 'Hello World')"

check "pad left-pads to width" "  hi" "$(./bin/astrycs pad 4 hi)"

check "reverse flips characters" "olleh" "$(./bin/astrycs reverse hello)"

check "strip removes characters" "heo" "$(./bin/astrycs strip l hello)"

check "title capitalizes each word" "Hello World" "$(./bin/astrycs title 'hello world')"

check "nospace collapses whitespace runs" "a b" "$(./bin/astrycs nospace 'a     b')"

check "wrap breaks long lines" "aaa
bbb" "$(./bin/astrycs wrap 3 aaabbb)"

check "indent adds leading spaces" "    hi" "$(./bin/astrycs indent 4 hi)"

check "words counts whitespace-separated words" "3" "$(./bin/astrycs words 'a b c')"

check "lines counts lines" "2" "$(./bin/astrycs lines 'a
b')"
check "lines reports zero for empty text" "0" "$(./bin/astrycs lines '')"

check "head keeps the first lines" "a" "$(./bin/astrycs head 1 'a
b')"

check "tail keeps the last lines" "b" "$(./bin/astrycs tail 1 'a
b')"

check "unique sorts and dedupes" "a
b" "$(./bin/astrycs unique 'b
a
b')"

check "sortlines sorts alphabetically" "a
b" "$(./bin/astrycs sortlines 'b
a')"

check "csv-join quotes cells containing the separator" '"a,b",c' "$(./bin/astrycs csv-join , 'a,b' c)"

check "replace swaps every occurrence" "heXXo" "$(./bin/astrycs replace l X hello)"
check "replace passes text through when find is empty" "hello" "$(./bin/astrycs replace "" X hello)"

check "camel joins words in camelCase" "helloWorld" "$(./bin/astrycs camel 'hello world')"

check "kebab joins words with dashes" "hello-world" "$(./bin/astrycs kebab 'Hello World')"

check "snake joins words with underscores" "hello_world" "$(./bin/astrycs snake 'Hello World')"

check "capitalize only touches the first letter" "Hello world" "$(./bin/astrycs capitalize 'hello WORLD')"

check "swapcase inverts each letter" "hELLO" "$(./bin/astrycs swapcase Hello)"

if [ "$fail" -ne 0 ]; then
    printf '\nsome tests failed\n' >&2
    exit 1
fi

printf '\nall tests passed\n'
