#include "isogram.h"
#include <string.h>
#include <ctype.h>
#include <stdio.h>

/* I'll need some place to keep track of the letters which have already been seen and a way to check
them later. But how can I know how big the phrase will be so I can make a buffer large enough?

For now, define a fixed buffer than can handle a-z.

*/

#define MAX_PHRASE_SIZE 26
/* I should probably learn how to use gdb... */
/* #define CHEEZY_DEBUGGING */

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
#ifdef CHEEZY_DEBUGGING
  printf("length: %i\n", phrase_length);
#endif
  for(i=0;i<phrase_length;i++)
  {
#ifdef CHEEZY_DEBUGGING
    printf(" %c ", phrase[i]);
#endif
    int char_code=(int) tolower(phrase[i]) - (int)'a';
    /* Non-alphabetics are skipped */
    if (char_code < 0 || char_code > MAX_PHRASE_SIZE) {
      continue;
    }
#ifdef CHEEZY_DEBUGGING
    printf("(%i) ", char_code);
#endif
    if (letter_seen[char_code] == true) {
      return false;
    }
    letter_seen[char_code] = true;
  }
  return true;
}