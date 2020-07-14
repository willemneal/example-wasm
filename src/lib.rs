use std::str;


extern "C" {
    fn print_str(ptr: *const u8, len: usize);
}

static HELLO: &'static str = "Hello, World!";


#[no_mangle]
pub extern "C" fn hello_wasm() {
    unsafe {
        print_str(HELLO.as_ptr(), HELLO.len());
    }
}
