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

if [ "$fail" -ne 0 ]; then
    printf '\nsome tests failed\n' >&2
    exit 1
fi

printf '\nall tests passed\n'
