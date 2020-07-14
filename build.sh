#!/bin/bash
set -e

cargo +stable build --target wasm32-unknown-unknown --silent
cp target/wasm32-unknown-unknown/debug/example_wasm.wasm ./res/example_wasm.orig.wasm

RUSTFLAGS='-C link-arg=-s' cargo +stable build --target wasm32-unknown-unknown --silent
cp target/wasm32-unknown-unknown/debug/example_wasm.wasm ./res/example_wasm.link_arg.wasm


echo "original"
wasm-nm -j -p res/example_wasm.orig.wasm

echo "-C link-arg=-s"
wasm-nm -j -p res/example_wasm.link_arg.wasm
