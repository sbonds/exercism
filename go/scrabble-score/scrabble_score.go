/*Package scrabble computes the score of a single word based on the rules of
the Scrabble game
*/
package scrabble

/* The value for each letter. We could have made this more compact by
making arrays of letters and searching them to find the values, but the
size of a 26 element list isn't too bad and it's extremely straightforward
to read. */
/* https://blog.golang.org/strings
Strings, bytes, runes, and characters. Oh, my!
*/
/* Could I make a map with both upper and lowercase keys to the same value?
https://golang.org/ref/spec#Composite_literals
No, no I cannot.

Also bitfield-the-mentor let me know that maps return zero instead of an error
for missing keys. That can be a great shortcut, but also can lead to unexpected
issues if we hit a key that we thought should be mapped, but wasn't.
*/
var letterScore = map[rune]int{
	'A': 1,
	'B': 3,
	'C': 3,
	'D': 2,
	'E': 1,
	'F': 4,
	'G': 2,
	'H': 4,
	'I': 1,
	'J': 8,
	'K': 5,
	'L': 1,
	'M': 3,
	'N': 1,
	'O': 1,
	'P': 3,
	'Q': 10,
	'R': 1,
	'S': 1,
	'T': 1,
	'U': 1,
	'V': 4,
	'W': 4,
	'X': 8,
	'Y': 4,
	'Z': 10,
	'a': 1,
	'b': 3,
	'c': 3,
	'd': 2,
	'e': 1,
	'f': 4,
	'g': 2,
	'h': 4,
	'i': 1,
	'j': 8,
	'k': 5,
	'l': 1,
	'm': 3,
	'n': 1,
	'o': 1,
	'p': 3,
	'q': 10,
	'r': 1,
	's': 1,
	't': 1,
	'u': 1,
	'v': 4,
	'w': 4,
	'x': 8,
	'y': 4,
	'z': 10,
}

/*Score returns the Scrabble value of a word (string) provided to it.

It does not look like the testing method requires a way to pass in options
like letter or word score multipliers.
*/
func Score(originalWord string) int {
	wordScore := 0
	// Iterating over a string: https://golang.org/doc/effective_go.html#for
	// Also helpful: https://blog.golang.org/strings
	// https://stackoverflow.com/questions/18130859/how-can-i-iterate-over-a-string-by-runes-in-go
	for _, char := range originalWord {
		// It might be smart to put a handler in here for the case of letterScore not
		// existing for a given byte
		wordScore += letterScore[char]
	}
	return wordScore
}

/* Benchmarks:

Naive rune-based implementation:

	$ go test -v --bench . --benchmem
	=== RUN   TestScore
	--- PASS: TestScore (0.00s)
	goos: windows
	goarch: amd64
	BenchmarkScore-4         1000000              1217 ns/op             152 B/op        16 allocs/op
	PASS
	ok      scrabble-score    1.560s

Using unicode.ToUpper inside the loop instead of converting the word ahead of time:

	$ go test -v --bench . --benchmem
	=== RUN   TestScore
	--- PASS: TestScore (0.00s)
	goos: windows
	goarch: amd64
	BenchmarkScore-4         2000000               872 ns/op               0 B/op         0 allocs/op
	PASS
	ok      scrabble-score    3.548s

Making the map larger to do a direct lookup whether uppercase or lowercase:

	$ go test -v --bench . --benchmem
	=== RUN   TestScore
	--- PASS: TestScore (0.00s)
	goos: windows
	goarch: amd64
	BenchmarkScore-4         2000000               855 ns/op               0 B/op         0 allocs/op
	PASS
	ok      scrabble-score    2.926s

Essentially no change-- a needless "optimization"
*/
