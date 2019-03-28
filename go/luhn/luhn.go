/*Package luhn determines if a given sequence of numbers matches the Luhn checksum .*/
package luhn

import "strings"

/*Based on the testing it looks like we need to implement a method called Valid(string)
which returns a boolean based on whether the string contains a valid series of numbers
matching the Luhn checksum.
*/

/*Valid returns true if the digits in the input make a valid Luhn checksum, false otherwise. */
func Valid(sequenceOfNumbers string) bool {
	spaceFreeSequenceOfNumbers := RemoveSpaces(sequenceOfNumbers)
	if len(spaceFreeSequenceOfNumbers) <= 1 {
		return false
	}
	return true
}

/*RemoveSpaces is used internally to remove any spaces from the string passed in.
It could also have been 'unexported' based on golint, but that seemed to be surprisingly
unusual and/or difficult to do. */
func RemoveSpaces(stringWithSpaces string) string {
	// Split on spaces and join on nothing. It's simple to read, but may not benchmark well.
	return strings.Join(strings.Fields(stringWithSpaces), "")
}
