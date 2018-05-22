#include <stdio.h>

void my_wc (char * fileName);

int main (int argc, char *argv[])
{
    //Call function with user input
    my_wc(argv[1]);
}

void my_wc (char * fileName)
{
  FILE *fp;
  FILE *stdin;
  char lineSave[99];
  int lineCount = 1;
  int wordCount = 1;
  int byteCount;

  if (fileName != NULL)
  {
      fp = fopen(fileName, "r");
  }

  if (fileName != NULL)
  {
      //Read lines of file
      while (fgets(lineSave, 99, fp) != NULL)
      {
          for (int i = 0; i < (sizeof(lineSave) / sizeof(int)); i++)
          {
              //If withespace exists, add 1 to "wordCount"
              if (lineSave[i] == ' ')
              {
                  wordCount++;
              }
              //If new line exists, add 1 to "lineCount"
              if (lineSave[i] == '\n')
              {
                  lineCount++;
              }
          }
          //Get byte size of "lineSave"
          byteCount = sizeof(lineSave);
      }
  }
  else
  {
      //Read lines of stdin
      while (fgets(lineSave, 99, stdin) != NULL)
      {
          for (int i = 0; i < (sizeof(lineSave) / sizeof(int)); i++)
          {
              if (lineSave[i] == ' ')
              {
                  wordCount++;
              }
              if (lineSave[i] == '\n')
              {
                  lineCount++;
              }
          }
          byteCount = sizeof(lineSave);
      }
  }

  //Print all vars
  fprintf(stdout, "Line Count: %d\nWord Count: %d\nByte Count: %d\n", lineCount, wordCount, byteCount);
}
