/*Package hamming calculates the Hamming difference between two DNA strands via the single
function 'Distance'
*/
package hamming

import "fmt"

/*Distance calculates the Hamming difference between two DNA strands. It takes two
strings which represent nucleic acid abbreviations (A, C, G, or T) and counts the
number of positions in which the two nucleic acids are different.

If the strands are different lengths this cannot be calculated and the function should
return an error.
*/
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return -1, fmt.Errorf("Cannot compare different length strings: %d vs. %d", len(a), len(b))
	}

	var difference = 0
	// Try an old fashioned "for" loop. Classic!
	// Helpful: https://www.digitalocean.com/community/questions/how-to-efficiently-compare-strings-in-go
	for i := 0; i < len(a); i++ {
		if a[i] == b[i] {
			continue
		}
		difference++
	}
	return difference, nil
}
