# CA21062

## Archivos

- `multiplicador.asm`: Multiplica dos números de 8 bits.
- `restador.asm`: Resta tres números de 16 bits.
- `division.asm`: Divide dos números de 32 bits y muestra cociente y residuo.
  
## Compilación y ejecución

Para compilar y ejecutar cualquiera de los programas:

```bash
nasm -f elf32 archivo.asm -o archivo.o
ld -m elf_i386 archivo.o -o archivo
./archivo
