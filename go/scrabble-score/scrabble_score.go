/*Package scrabble computes the score of a single word based on the rules of
the Scrabble game
*/
package scrabble

import "strings"

/* The value for each letter. We could have made this more compact by
making arrays of letters and searching them to find the values, but the
size of a 26 element list isn't too bad and it's extremely straightforward
to read. */
/* https://blog.golang.org/strings
Strings, bytes, runes, and characters. Oh, my!
*/
var letterScore = map[byte]int{
	'A': 1,
}

/*Score returns the Scrabble value of a word (string) provided to it.

It does not look like the testing method requires a way to pass in options
like letter or word score multipliers.
*/
func Score(originalWord string) int {
	// Make the input uppercase to simplify the map we need to make
	word := strings.ToUpper(originalWord)
	wordScore := 0
	// Iterating over a string: https://golang.org/doc/effective_go.html#for
	// Also helpful: https://blog.golang.org/strings
	for i := 0; i < len(word); i++ {
		wordScore += letterScore[word[i]]
	}
	return wordScore
}
