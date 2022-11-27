# Модификации
## Был использован аргумент командной строки: 
~~~
gcc -masm=intel \
-fno-asynchronous-unwind-tables \
-fno-jump-tables \
-fno-stack-protector \
-fno-exceptions \
./main.c \
-S -o ./main_updated.s
~~~
## <br> Также удалены бесполезный присваивания из main.s:
> \- mov	rax, QWORD PTR -8[rbp]
> <br> - mov	rdi, rax
> <br> + mov	rdi, QWORD PTR -8[rbp]

> \- mov	rax, QWORD PTR -16[rbp]
> <br> - mov	rdi, rax
> <br> + mov	rdi, QWORD PTR -16[rbp]

> \- mov	eax, DWORD PTR -36[rbp]
> <br> - mov	edi, eax
> <br> + mov	edi, DWORD PTR -36[rbp]

> \- mov	eax, DWORD PTR -20[rbp]
> <br> - mov	esi, eax
> <br> + mov	esi, DWORD PTR -20[rbp]

## <br> Так же во всех файлах удалены:
> endbr64
