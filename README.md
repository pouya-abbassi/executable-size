# executable-size
Let's see which compiler gives us the smallest hello world. For more information about this comparison, please check my article on [Executable Size of Different Compilers](https://pouyacode.net/executable-size-of-different-compilers.html).

You can use `make` command to compile each source code, try `make help` to see the available options.


## System configuration
* OS: Debian Sid
* Architecture: x86_64
* gcc: 10.2.1
* g++: 10.2.1
* glibc: 2.31-12
* rustc: 1.53.0
* go: go1.15.9
* sbcl: 2.1.1
* ccl: 1.12


## Current stats
| Language                       | Static (Bytes) | Dynamic (Bytes) |
|--------------------------------|----------------|-----------------|
| C                              | 782768         | 16608           |
| C++                            | 2199656        | 17248           |
| C++ (with stdio)               | 782776         | 16616           |
| Rust                           | 4775696        | 3259488         |
| Rust (size optimization)       | 4774864        | 17272           |
| Go                             | 2034781        |                 |
| Go (without DWARF and striped) | 1396736        |                 |
| Common LISP, SBCL              |                | 38739616        |
| Common Lisp, CCL               |                | 27214064        |
