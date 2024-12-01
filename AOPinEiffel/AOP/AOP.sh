#!/bin/sh
export ISE_PLATFORM=${ISE_PLATFORM:-linux-x86-64}
gcc `/home/agarciafdz/Eiffel_22.05/library/base/elks/encoding/implementation/unix/Clib/iconv-config --include_path` -I"/home/agarciafdz/Eiffel_22.05/library/base/elks/encoding/implementation/include"  -c AOP1.c
gcc `/home/agarciafdz/Eiffel_22.05/library/base/elks/encoding/implementation/unix/Clib/iconv-config --library` -o AOP AOP1.o  -lm  
