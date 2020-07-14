# Example of lack of symbols in generated debug Wasm binary

If wasm target not installed
```
rustup target add wasm32-unknown-unknown
```

Install wasm name binary to read name section
```
cargo install wasm-nm
```

build and see names
```
./build.sh
```
