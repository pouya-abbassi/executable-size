help:
	@echo 'Makefile for compiling a few "Hello, World!" programs in differest languages.   '
	@echo 'More info: https://pouyacode.net/executable-size-of-different-compilers.html    '
	@echo '                                                                                '
	@echo 'Usage:                                                                          '
	@echo '   make clean             Remove compiled program                               '
	@echo '                                                                                '
	@echo '   make c                 Compile C file,    with static linking                '
	@echo '   make c-dynamic         Compile C file,    with dynamic linking               '
	@echo '                                                                                '
	@echo '   make cpp               Compile C++ file,  with static linking                '
	@echo '   make cpp-dynamic       Compile C++ file,  with dynamic linking               '
	@echo '   make cpp-stdio         Compile C++ file,  with static linking, use stdio.h   '
	@echo '   make cpp-stdio-dynamic Compile C++ file,  with dynamic linking, use stdio.h  '
	@echo '                                                                                '
	@echo '   make rust              Compile Rust file, with static linking                '
	@echo '   make rust-dynamic      Compile Rust file, with dynamic linking               '
	@echo '   make rust-size         Compile Rust file, with static linking, optimize size '
	@echo '   make rust-size-dynamic Compile Rust file, with dynamic linking, optimize size'
	@echo '                                                                                '
	@echo '   make go                Compile Go file,   without DWARF and striped          '
	@echo '   make go-dwarf          Compile Go file,   with DWARF                         '
	@echo '                                                                                '
	@echo '   make lisp-sbcl         Compile LISP file using SBCL compiler                 '
	@echo '   make lisp-ccl          Compile LISP file, using CCL compiler                 '
	@echo '                                                                                '


c:
	gcc hello.c --static -o hello
	stat --printf="%s Bytes\n" hello


c-dynamic:
	gcc hello.c -o hello
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
