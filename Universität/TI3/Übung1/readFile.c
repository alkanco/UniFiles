#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>

//Übung 1
//Alkan Akarsu, William Djalal

int main ()
{
   //Create vars
   uint64_t result;
   uint64_t product;
   uint64_t sum;
   uint64_t temp1;
   uint64_t temp2;

   FILE * fp;

   //Open "test.dat" file in read only
   fp = fopen ("test.dat", "r");
   fscanf(fp, "%"PRIu64, &result);

   while(1)
   {
        fscanf(fp , "%"PRIu64 " *" " %"PRIu64, &temp1, &temp2);
        //Calculate product of given numbers
      	product = temp1 * temp2;
      	if (feof(fp))
        {
            break;
        }
      	sum += product;
   }

   printf("The result should be: %li\n", result);
   if (result == sum)
   {
      printf("The sum of the products is correct!\n");
   }
   else
   {
	    printf("The sum of the products is incorrect!\n");
   }
   //Close file and return from main
   fclose(fp);
   return(0);
}
