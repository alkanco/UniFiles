/**
Wir hatten Probleme mit dieser Aufgabe. Wir konnten kaum etwas
mit der Aufgabenstellung anfangen und außerdem haben wir noch nie
mit malloc() etc. gearbeitet. Wir haben uns lange mit der Aufgabe beschäftigt,
konnten aber zu keinem Ergebnis kommen. Wir wissen nicht was memory_allocate tun soll
und uns fiel auch keine Funktion ein, die wir verwenden könnten.
**/

#define MEM_SIZE 2048

void memory_init()
{
    char memory[MEM_SIZE];

    int *memoryArea = malloc(memory);
}

void* memory_allocate(size_t byte_count)
{

}

void memory_free(void* pointer)
{
    free(pointer);
}

void memory_print()
{

}
