/*Package isogram determines if any of the letters in a word are used more than once
(case insensitive, discarding non-word characters)
*/
package isogram

import "unicode"

/*IsIsogram returns true if no letters are used more than once, false otherwise. */
func IsIsogram(word string) bool {
	/* Keep track of the letters found so far by using a map.
	   https://gobyexample.com/maps
	*/
	lettersSeen := make(map[rune]bool)
	// https://stackoverflow.com/questions/18130859/how-can-i-iterate-over-a-string-by-runes-in-go
	for _, char := range word {
		/* Filter out "non-word" characters. What is a "word"? It's complicated...

		https://golang.org/pkg/regexp/syntax/
		An ASCII-only option is the aptly-named "IsWordChar" function. Easy, but non-international. (funny how those two go together)
		A more portable option might be checking if the rune matches the Unicode character class "L" for letter
		(https://en.wikipedia.org/wiki/Unicode_character_property#General_Category)

		https://gobyexample.com/regular-expressions
		No good example for the single-character MatchRune() function mentioned on the above golang syntax page so use
		a naive implementation using MatchString() since clear examples are available.
		See if MatchRune works and is faster once the code is working.

		Even the simple MatchString isn't working as expected, but in the process of trying to make that work
		I ran across these nice Unicode functions: https://golang.org/pkg/unicode/
		isLetter() looks especially handy!

		Example: https://stackoverflow.com/questions/38554353/how-to-check-if-a-string-only-contains-alphabetic-characters-in-go
		*/
		if !unicode.IsLetter(char) {
			continue
		}
		// Normalize to uppercase
		uppercaseChar := unicode.ToUpper(char)
		if lettersSeen[uppercaseChar] {
			return false
		}
		lettersSeen[uppercaseChar] = true
	}
	return true
}

/* Benchmark results of initial method:

	$ go test -v --bench . --benchmem
	=== RUN   TestIsIsogram
	--- PASS: TestIsIsogram (0.00s)
			isogram_test.go:11: PASS: Word ""
			isogram_test.go:11: PASS: Word "isogram"
			isogram_test.go:11: PASS: Word "eleven"
			isogram_test.go:11: PASS: Word "zzyzx"
			isogram_test.go:11: PASS: Word "subdermatoglyphic"
			isogram_test.go:11: PASS: Word "Alphabet"
			isogram_test.go:11: PASS: Word "alphAbet"
			isogram_test.go:11: PASS: Word "thumbscrew-japingly"
			isogram_test.go:11: PASS: Word "six-year-old"
			isogram_test.go:11: PASS: Word "Emily Jung Schwartzkopf"
			isogram_test.go:11: PASS: Word "accentor"
			isogram_test.go:11: PASS: Word "angola"
	goos: windows
	goarch: amd64
	BenchmarkIsIsogram-4      200000              6128 ns/op            1273 B/op        11 allocs/op
	PASS
	ok      isogram   2.566s

Since I found the unicode.IsLetter method instead of a regex match, I don't have any ideas on how to
performance optimize this further.

*/
