#include <stdio.h>

void my_cat (char * fileName);

int main (int argc, char *argv[])
{
    //Call function with input of user
    my_cat(argv[1]);
}

void my_cat (char * fileName)
{
    FILE *fp;
    FILE *stdin;
    char lineSave[99];

    //If file exists
    if (fileName != NULL)
    {
        //Read file
        fp = fopen(fileName, "r");
    }

    if (fileName != NULL)
    {
        //Read lines of file and save to "lineSave"
        while (fgets(lineSave, 99, fp) != NULL)
        {
            //Print "lineSave"
            fprintf(stdout, "%s\n", lineSave);
        }
    }
    else
    {
        //Read lines of std
        while (fgets(lineSave, 99, stdin) != NULL)
        {
            fprintf(stdout, "%s\n", lineSave);
        }
    }
}

//Zu Aufgabe 2 c)
//Wir haben das System von fork() verstanden und haben damit experimentiert.
//Leider haben wir es nicht geschafft, dies in unsere beiden Programme einzubauen.
//Die Grundidee wäre zu prüfen ob argc > 2 ist, da das heißt, dass mehr als ein Dateiname angegeben wird.
//Wenn das der Fall ist wird so oft geforkt, wie Dateinamen vorhanden sind.
//Anschließend printen alle Child Prozesse ihre Lösung.
