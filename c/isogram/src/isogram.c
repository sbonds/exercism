#include "isogram.h"
#include <string.h>
#include <ctype.h>
#include <stdio.h>

/* I'll need some place to keep track of the letters which have already been seen and a way to check
them later. But how can I know how big the phrase will be so I can make a buffer large enough?

For now, define a fixed buffer than can handle a-z.

*/

#define MAX_PHRASE_SIZE 26

bool is_isogram(const char phrase[]) 
{
  /* A NULL phrase is always not an isogram */
  if (phrase == NULL) {
    return false;
  }

  int i;
  /* Index used: a=0, b=1, c=2, ... z=26
    Also initialize to "false"
  */
  bool letter_seen[MAX_PHRASE_SIZE];
  for(i=0;i<MAX_PHRASE_SIZE;i++)
  {
    letter_seen[i] = false;
  }

  int phrase_length=strlen(phrase);
  printf("length: %i\n", phrase_length);
  for(i=0;i<phrase_length;i++)
  {
    printf(" %c ", phrase[i]);
    int char_code=(int) tolower(phrase[i]) - (int)'a';
    printf("(%i) ", char_code);
    if (letter_seen[char_code] == true) {
      return false;
    }
    /* TODO: put in a bounds check to prevent buffer overflow */
    letter_seen[char_code] = true;
  }
  return true;
}