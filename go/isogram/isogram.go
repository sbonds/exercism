/*Package isogram determines if any of the letters in a word are used more than once
(case insensitive, discarding non-word characters)
*/
package isogram

/*IsIsogram returns true if no letters are used more than once, false otherwise. */
func IsIsogram(word string) bool {
	/* Keep track of the letters found so far by using a map.
	   https://gobyexample.com/maps
	*/
	lettersSeen := make(map[rune]bool)
	// https://stackoverflow.com/questions/18130859/how-can-i-iterate-over-a-string-by-runes-in-go
	for _, char := range word {
		if lettersSeen[char] {
			return false
		}
		lettersSeen[char] = true
	}
	return true
}
