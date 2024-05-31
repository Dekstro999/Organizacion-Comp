#include <stdint.h>

void add_numbers(uint32_t a, uint32_t b, uint32_t *result)
{
    __asm__(
        "add %1, %2;"
        "mov %2, %0;"
        : "=r"(*result)
        : "r"(a), "r"(b));
}

int main()
{
    uint32_t result;
    add_numbers(5, 10, &result);
    // El resultado debería ser 15
    return 0;
}
