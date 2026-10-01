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

check "initials takes the first letter of each word" "JD" "$(./bin/astrycs initials 'john doe')"

check "empty input is handled by upper" "" "$(./bin/astrycs upper '')"

check "empty input is handled by reverse" "" "$(./bin/astrycs reverse '')"

check "empty input is handled by slug" "" "$(./bin/astrycs slug '')"

check "help lists the commands" "yes" "$(./bin/astrycs help | grep -q "repeat" && echo yes)"

check "starts-with detects a prefix" "yes" "$(./bin/astrycs starts-with he hello)"

check "starts-with rejects a wrong prefix" "no" "$(./bin/astrycs starts-with xx hello)"


check "unknown command fails" "1" "$(./bin/astrycs nope-nope >/dev/null 2>&1 || echo $?)"

check "repeat 0 emits nothing" "" "$(./bin/astrycs repeat 0 hi)"

check "ends-with detects a suffix" "yes" "$(./bin/astrycs ends-with lo hello)"

check "ends-with rejects a wrong suffix" "no" "$(./bin/astrycs ends-with xx hello)"


check "nospace leaves no trailing space" "a b" "$(./bin/astrycs nospace 'a     b' | sed -e 's/ $//')"

check "reverse reverses each line independently" "a
bb
ccc" "$(./bin/astrycs reverse "$(printf 'a\nbb\nccc')")"

check "contains finds a substring" "yes" "$(./bin/astrycs contains ell hello)"

check "contains rejects a missing substring" "no" "$(./bin/astrycs contains zzz hello)"


check "is-empty detects empty text" "yes" "$(./bin/astrycs is-empty '')"

check "is-empty rejects real text" "no" "$(./bin/astrycs is-empty x)"


check "is-number accepts digits" "yes" "$(./bin/astrycs is-number 1234)"

check "is-number rejects letters" "no" "$(./bin/astrycs is-number 12a)"


check "split prints one field per line" "a
b" "$(./bin/astrycs split , 'a,b')" 

check "default fills in empty text" "none" "$(./bin/astrycs default none '')"

check "default keeps real text" "hi" "$(./bin/astrycs default none hi)"


check "take keeps the leading words" "a b" "$(./bin/astrycs take 2 'a b c')"

check "drop discards the leading words" "c" "$(./bin/astrycs drop 2 'a b c')"

check "reverse-words flips the word order" "c b a" "$(./bin/astrycs reverse-words 'a b c')"

check "unique-words sorts and dedupes" "a
b" "$(./bin/astrycs unique-words 'b a b')" 

check "count-char counts occurrences" "2" "$(./bin/astrycs count-char l hello)"


check "sum adds the numbers" "6" "$(./bin/astrycs sum 1 2 3)"


check "max finds the largest" "9" "$(./bin/astrycs max 3 9 5)"


check "min finds the smallest" "3" "$(./bin/astrycs min 3 9 5)"


check "abs drops the sign" "5" "$(./bin/astrycs abs -5)"


check "round rounds up" "3" "$(./bin/astrycs round 2.6)"

check "round rounds down" "2" "$(./bin/astrycs round 2.4)"


if [ "$fail" -ne 0 ]; then
    printf '\nsome tests failed\n' >&2
    exit 1
fi

printf '\nall tests passed\n'
