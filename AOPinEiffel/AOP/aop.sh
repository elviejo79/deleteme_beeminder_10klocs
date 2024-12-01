#!/bin/sh
export ISE_PLATFORM=${ISE_PLATFORM:-linux-x86-64}
gcc `/home/agarciafdz/Eiffel_22.05/library/base/elks/encoding/implementation/unix/Clib/iconv-config --include_path` -I"/home/agarciafdz/Eiffel_22.05/library/base/elks/encoding/implementation/include" -I"/home/agarciafdz/Eiffel_22.05/library/time/spec/include"  -c aop1.c
gcc `/home/agarciafdz/Eiffel_22.05/library/base/elks/encoding/implementation/unix/Clib/iconv-config --library` `/home/agarciafdz/Eiffel_22.05/library/net/Clib/net-config --library` -o aop aop1.o "/home/agarciafdz/Eiffel_22.05/library/net/spec/linux-x86-64/lib/libmtnet.a"  -lm  
