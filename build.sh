#!/bin/bash
set -e

if ! test -e res/; then
 mkdir res
fi

cargo build --target wasm32-unknown-unknown
cp target/wasm32-unknown-unknown/debug/example_wasm.wasm ./res/example_wasm.orig.wasm

RUSTFLAGS='-C link-arg=-s' cargo build --target wasm32-unknown-unknown
cp target/wasm32-unknown-unknown/debug/example_wasm.wasm ./res/example_wasm.link_arg.wasm

echo
echo

echo "original"
wasm-nm -j -p res/example_wasm.orig.wasm
echo "------------------------------------"
echo
echo "-C link-arg=-s"
wasm-nm -j -p res/example_wasm.link_arg.wasm
