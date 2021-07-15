help:
	@echo 'Makefile for compiling a few "Hello, World!" programs in differest languages.'
	@echo 'More info: https://pouyacode.net/executable-size-of-different-compilers.html'
	@echo ''
	@echo 'Usage:'
	@echo ''
	@echo ' Command    | Description             '
	@echo '------------|-------------------------'
	@echo ' make clean | Remove compiled program '
	@echo ''
	@echo ' Command                    | Language | Compiler | Linking | Notes            '
	@echo '----------------------------|----------|----------|---------|------------------'
	@echo ' make c                     | C        | gcc      | Static  |                  '
	@echo ' make c-dynamic             | C        | gcc      | Dynamic |                  '
	@echo '----------------------------|----------|----------|---------|------------------'
	@echo ' make clang                 | C        | clang    | Static  | LLVM             '
	@echo ' make clang-dynamic         | C        | clang    | Dynamic | LLVM             '
	@echo '----------------------------|----------|----------|---------|------------------'
	@echo ' make cpp                   | C++      | g++      | Static  |                  '
	@echo ' make cpp-dynamic           | C++      | g++      | Dynamic |                  '
	@echo ' make cpp-stdio             | C++      | g++      | Static  | cstdio           '
	@echo ' make cpp-stdio-dynamic     | C++      | g++      | Dynamic | cstdio           '
	@echo '----------------------------|----------|----------|---------|------------------'
	@echo ' make clang++               | C++      | clang++  | Static  | LLVM             '
	@echo ' make clang++-dynamic       | C++      | clang++  | Dynamic | LLVM             '
	@echo ' make clang++-stdio         | C++      | clang++  | Static  | LLVM & cstdio    '
	@echo ' make clang++-stdio-dynamic | C++      | clang++  | Dynamic | LLVM & cstdio    '
	@echo '----------------------------|----------|----------|---------|------------------'
	@echo ' make rust                  | Rust     | rustc    | Static  |                  '
	@echo ' make rust-dynamic          | Rust     | rustc    | Dynamic |                  '
	@echo ' make rust-size             | Rust     | rustc    | Static  | Optimize size    '
	@echo ' make rust-size-dynamic     | Rust     | rustc    | Dynamic | Optimize size    '
	@echo '----------------------------|----------|----------|---------|------------------'
	@echo ' make go                    | Go       | go       | Static  | -DWARF & striped '
	@echo ' make go-dwarf              | Go       | go       | static  | +DWARF           '
	@echo '----------------------------|----------|----------|---------|------------------'
	@echo ' make lisp-sbcl             | LISP     | sbcl     | dynamic |                  '
	@echo ' make lisp-ccl              | LISP     | ccl      | dynamic |                  '


c:
	gcc hello.c --static -o hello
	stat --printf="%s Bytes\n" hello


c-dynamic:
	gcc hello.c -o hello
	stat --printf="%s Bytes\n" hello

clang:
	clang hello.c --static -o hello
	stat --printf="%s Bytes\n" hello


clang-dynamic:
	clang hello.c -o hello
	stat --printf="%s Bytes\n" hello


cpp:
	g++ hello.cpp --static -o hello
	stat --printf="%s Bytes\n" hello


cpp-dynamic:
	g++ hello.cpp -o hello
	stat --printf="%s Bytes\n" hello


cpp-stdio:
	g++ hello-stdio.cpp --static -o hello
	stat --printf="%s Bytes\n" hello


cpp-stdio-dynamic:
	g++ hello-stdio.cpp -o hello
	stat --printf="%s Bytes\n" hello

clang++:
	clang++ hello.cpp --static -o hello
	stat --printf="%s Bytes\n" hello


clang++-dynamic:
	clang++ hello.cpp -o hello
	stat --printf="%s Bytes\n" hello


clang++-stdio:
	clang++ hello-stdio.cpp --static -o hello
	stat --printf="%s Bytes\n" hello


clang++-stdio-dynamic:
	clang++ hello-stdio.cpp -o hello
	stat --printf="%s Bytes\n" hello


rust:
	rustc -C target-feature=+crt-static hello.rs
	stat --printf="%s Bytes\n" hello


rust-dynamic:
	rustc -C target-feature=-crt-static hello.rs
	stat --printf="%s Bytes\n" hello


rust-size:
	rustc -C opt-level=s -C target-feature=+crt-static hello.rs
	stat --printf="%s Bytes\n" hello


rust-size-dynamic:
	rustc -C opt-level=s -C prefer-dynamic -C target-feature=-crt-static hello.rs
	stat --printf="%s Bytes\n" hello


go:
	go build -ldflags "-s -w" hello.go
	stat --printf="%s Bytes\n" hello


go-dwarf:
	go build hello.go
	stat --printf="%s Bytes\n" hello


lisp-sbcl:
	sbcl --load hello.lisp --eval "(sb-ext:save-lisp-and-die \"hello\" :toplevel #'main :executable t)"
	stat --printf="%s Bytes\n" hello


lisp-ccl:
	ccl --load hello.lisp --eval "(save-application \"hello\" :toplevel-function #'main :prepend-kernel t)"
	stat --printf="%s Bytes\n" hello


clean:
	rm hello
