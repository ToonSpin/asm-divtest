# Assembly language performance test

This project contains three .asm files. If you have nasm, ld, and make
installed, then the Makefile should be able to assemble the files in the bin
directory.

The idea is that the three assembly source files are identical except for the
registers used:

- The "64" version uses rbx, rcx and so on;
- The "32" version uses ebx, ecx and so on;
- The "16" version uses bx, cx and so on.

On my machine (an Intel Core i5-7600) the resulting binaries perform
dramatically differently:

- divtest64: 630ms
- divtest32: 200ms
- divtest16: 574ms
